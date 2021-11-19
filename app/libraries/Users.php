<?php
    namespace Library;

    use Helper\Validate as Validator;

    class Users {
        private $db = NULL;
        private $policy = NULL;

        private $required = array("firstname", "lastname", "email", "password");
        private $allowed = array("firstname", "lastname", "email", "password", "username", "status");
        private $filterAllowedProperties = array("id", "firstname", "lastname", "email", "username", "status", "created", "updated");
        private $userStatusses = array("UNVERIFIED", "VERIFIED", "LOCKED");

        public function __construct() {
            $this->db = new Database;
            $this->policy = new Policy;

            if ($this->policy->get('usernames-enabled') == '1') array_push($this->allowed, "username");
            if ($this->policy->get('usernames-required') == '1') array_push($this->required, "username");
        }

        public function create($user) {
            $user = Validator::trimObject($user);
            $missing = Validator::listMissing($this->required, $user);
            if (count($missing) == 0) {
                $user = (object) Validator::removeUnlisted($this->allowed, $user);
                if (isset($user->status) && !in_array($user->status, $this->userStatusses)) unset($user->status);

                $user->email = filter_var($user->email, FILTER_SANITIZE_EMAIL);
                if (!filter_var($user->email, FILTER_VALIDATE_EMAIL)) return (object) array(
                    "success" => false,
                    "error" => "invalid_email",
                    "message" => "The provided E-mail address does not validate as an E-mail address."
                );

                $passvalresult = $this->validatePassword($user->password); 
                if (!$passvalresult->success) return (object) array(
                    "success" => false,
                    "error" => "password_too_weak",
                    "message" => "The provided password does not qualify the site's password policy.",
                    "data" => $passvalresult->data,
                    "factors" => $passvalresult->factors,
                    "issues" => $passvalresult->issues
                );

                if (isset($user->username)) {
                    if (!$this->validateUsername($user->username)) {
                        return (object) array(
                            "success" => false,
                            "error" => "invalid_username",
                            "message" => "The provided username contains illegal characters or solely consists of numbers."
                        );
                    } 
                    
                    if ($this->find($user->username, false) != NULL) {
                        return (object) array(
                            "success" => false,
                            "error" => "username_taken",
                            "message" => "The provided username was already taken."
                        );
                    }
                }

                $user->password = password_hash($user->password, PASSWORD_DEFAULT);
                if ($this->find($user->email, false) == NULL) {
                    $sql = "INSERT INTO `" . DATABASE_TABLE_PREFIX . "users` (";
                    foreach(array_keys((array) $user) as $key) $sql .= "`${key}`, ";
                    $sql = substr($sql, 0, -2) . ") VALUES (";
                    foreach(array_values((array) $user) as $value) $sql .= "'${value}', ";
                    $sql = substr($sql, 0, -2) . ')';

                    $res = $this->db->query($sql);
                    return (object) array(
                        "success" => true,
                        "id" => $this->db->insert_id
                    );
                } else {
                    return (object) array(
                        "success" => false,
                        "error" => "user_exists",
                        "message" => "A user with the provided E-mail address already exists."
                    );
                }
            } else {
                return (object) array(
                    "success" => false,
                    "error" => "missing_information",
                    "message" => 'The following post information is missing from the request: ' . join(',', $missing) . '.',
                    "missing_info" => $missing
                );
            }
        }

        public function validatePassword($password, $passpolicy = '') {
            $passpolicy = strtoupper($passpolicy);
            $data = (object) array(
                "policy" => $this->policy->get('password-policy'),
                "uppercase" => boolval(preg_match('@[A-Z]@', $password)),
                "lowercase" => boolval(preg_match('@[a-z]@', $password)),
                "number" => boolval(preg_match('@[0-9]@', $password)),
                "special" => boolval(preg_match('@[^\w]@', $password)),
                "length" => strlen($password)
            );

            $passwordPolicies = new PasswordPolicies();
            $policies = (array) $passwordPolicies->properties();
            if (in_array($passpolicy, array_keys($policies)) || explode(':', $passpolicy)[0] == "CUSTOM") {
                $data->policy = $passpolicy;
            }

            $data->minimumLength = ($data->policy == "STRONG" ? 12 : ($data->policy == "MEDIUM" ? 8 : 6));
            $data->points = 0;

            $factors = (object) array(
                "uppercase" => $data->uppercase,
                "lowercase" => $data->lowercase,
                "number" => $data->number,
                "special" => $data->special,
                "length" => $data->length >= $data->minimumLength
            );

            foreach($factors as $factor => $passed) {
                if ($passed) $data->points++;
            }

            $data->factorCount = count(array_keys((array) $factors));
            $data->score = $data->points / $data->factorCount;

            $data->plainEnforcedPolicy = 'score=1';
            if (isset($policies[$data->policy])) {
                $data->plainEnforcedPolicy = strtolower($policies[$data->policy]);
            } else if (explode(':', $passpolicy)[0] == "CUSTOM") {
                $data->policy = "CUSTOM";
                $data->plainEnforcedPolicy = strtolower(explode(':', $passpolicy)[1]);
            } else {
                $data->policy = "STRONG";
            }

            $result = true;
            $issues = array();
            $data->enforcedPolicy = explode(',', $data->plainEnforcedPolicy);
            foreach($data->enforcedPolicy as $item) {
                $item = explode('=', $item);
                $key = $item[0];
                $value = (isset($item[1]) ? $item[1] : NULL);

                switch($key) {
                    case "uppercase":
                        if (!$factors->uppercase) {
                            $result = false;
                            array_push($issues, $key);
                        }
                        
                        break;
                    case "lowercase":
                        if (!$factors->lowercase) {
                            $result = false;
                            array_push($issues, $key);
                        }
                        
                        break;
                    case "number":
                        if (!$factors->number) {
                            $result = false;
                            array_push($issues, $key);
                        }
                        
                        break;
                    case "special":
                        if (!$factors->special) {
                            $result = false;
                            array_push($issues, $key);
                        }
                        
                        break;
                    case "length":
                        if ($value != NULL) {
                            $data->minimumLength = $value;
                            $factors->length = $data->length >= $data->minimumLength;
                        }
                            
                        if (!$factors->length) {
                            $result = false;
                            array_push($issues, $key);
                        }

                        break;
                    case "score":
                        if ($value == NULL) $value = 1;
                        if (!($data->score >= floatval($value))) {
                            $result = false;
                            array_push($issues, $key);
                        }
                        
                        break;
                }
            }

            return (object) array(
                "success" => $result,
                "data" => $data,
                "factors" => $factors,
                "issues" => $issues
            );
        }

        public function validateUsername($username) {
            if (preg_match("/[^A-Za-z0-9-_.]/", $username)) {
                return false;
            } else {
                if (strlen(strval(intval($username))) == strlen($username)) {
                    return false; //Contains only numbers. Usernames should not interfere with user IDs.
                } else {
                    return true;
                }
            }
        }

        public function find($identifier, $byIdAllowed = true) {
            if (is_numeric($identifier) && intval($identifier) === 0) return (object) array(
                "id" => 0,
                "firstname" => "Visitor",
                "lastname" => null,
                "fullname" => "Visitor",
                "email" => null,
                "username" => null,
                "password" => null,
                "status" => null,
                "created" => null,
                "updated" => null
            );

            $sql = "SELECT * FROM `" . DATABASE_TABLE_PREFIX . "users` WHERE `email`='${identifier}'";
            if ($this->policy->get('usernames-enabled') == '1') {
                $sql .= " OR `username`='${identifier}'";
            }

            if ($byIdAllowed) {
                $sql .= " OR `id`='${identifier}'";
            }

            $res = $this->db->query($sql);
            if ($res->num_rows > 0) {
                $res = (object) $res->fetch_assoc();
                $res->fullname = $res->firstname . ' ' . $res->lastname;
                $res->id = intval($res->id);
                return $res;
            } else {
                return NULL;
            }
        }

        public function info($identifier, $byIdAllowed = true) {
            $user = $this->find($identifier, $byIdAllowed);
            if ($user) $user->meta = $this->metaList($user->id);
            return $user;
        }

        public function list($input = array()) {
            $input = (object) $input;
            $sql = "SELECT * FROM `" . DATABASE_TABLE_PREFIX . "users`";

            if (count(array_keys(get_object_vars($input))) > 0) {
                $allowedFilters = array("limit", "offset", "order");

                $filters = (object) Validator::removeUnlisted($allowedFilters, $input);
                $properties = (object) Validator::removeUnlisted($this->filterAllowedProperties, $input);

                if (count(array_keys(get_object_vars($properties))) > 0) {
                    $sql .= " WHERE";
                    foreach($properties as $key => $value) {
                        if (array_keys(get_object_vars($properties))[0] !== $key) $sql .= " AND";
                        $sql .= " `${key}`='${value}'";
                    }
                }

                if (isset($filters->limit)) $sql .= " LIMIT " . $filters->limit;
                if (isset($filters->offset)) $sql .= " OFFSET " . $filters->offset;
                if (isset($filters->order)) $sql .= " ORDER BY `id` " . (strtolower($filters->order) == 'desc' ? "DESC" : "ASC");
            }

            $res = $this->db->query($sql);
            if ($res->num_rows > 0) {
                return (array) $res->fetch_all(MYSQLI_ASSOC);
            } else {
                return array();
            }
        }

        public function update($user, $changes) {
            if (is_numeric($user) && intval($user) === 0) return false;
            $user = $this->find($user);
            if ($user) {
                $changes = (object) Validator::removeUnlisted($this->allowed, $changes);
                if (count(array_keys((array) $changes)) > 0) {
                    if (isset($changes->status) && !in_array($user->status, $this->userStatusses)) unset($user->status);
                    if (isset($changes->email)) {
                        $changes->email = filter_var($changes->email, FILTER_SANITIZE_EMAIL);
                        if (!filter_var($changes->email, FILTER_VALIDATE_EMAIL)) {
                            return (object) array(
                                "success" => false,
                                "error" => "invalid_email",
                                "message" => "The provided E-mail address does not validate as an E-mail address."
                            );
                        }

                        if ($this->find($changes->email, false) != NULL && $changes->email !== $user->email) {
                            return (object) array(
                                "success" => false,
                                "error" => "user_exists",
                                "message" => "A user with the provided E-mail address already exists."
                            );
                        }
                    }

                    if (isset($changes->password)) {
                        $passvalresult = $this->validatePassword($changes->password); 
                        $changes->password = password_hash($changes->password, PASSWORD_DEFAULT);
                        if (!$passvalresult->success) return (object) array(
                            "success" => false,
                            "error" => "password_too_weak",
                            "message" => "The provided password does not qualify the site's password policy.",
                            "data" => $passvalresult->data,
                            "factors" => $passvalresult->factors,
                            "issues" => $passvalresult->issues
                        );
                    }

                    if (isset($changes->username)) {
                        if (!$this->validateUsername($changes->username)) {
                            return (object) array(
                                "success" => false,
                                "error" => "invalid_username",
                                "message" => "The provided username contains illegal characters or solely consists of numbers."
                            );
                        } 
                        
                        if ($this->find($changes->username, false) != NULL) {
                            return (object) array(
                                "success" => false,
                                "error" => "username_taken",
                                "message" => "The provided username was already taken."
                            );
                        }
                    }

                    $sql = "UPDATE `" . DATABASE_TABLE_PREFIX . "users` SET";
                    foreach($changes as $key => $value) {
                        if (array_keys((array) $changes)[0] != $key) $sql .= ",";
                        $sql .= " `$key`='$value'";
                    }

                    $sql .= ", `updated`=CURRENT_TIMESTAMP() WHERE `id`=" . $user->id;
                    $res = $this->db->query($sql);
                    return (object) array(
                        "success" => true
                    );
                } else {
                    return (object) array(
                        "success" => false,
                        "error" => "no_changes",
                        "message" => "No (valid) changes have been provided and made."
                    );
                }
            } else {
                return (object) array(
                    "success" => false,
                    "error" => "unknown_user",
                    "message" => "De gegeven gebruiker bestaat niet."
                );
            }
        }

        public function delete($user) {
            $user = $this->find($user);
            if ($user) {
                $this->purgeMeta($user->id);
                $this->db->query("DELETE FROM `" . DATABASE_TABLE_PREFIX . "users` WHERE `id`=" . $user->id);
                return (object) array(
                    "success" => true
                );
            } else {
                return (object) array(
                    "success" => false,
                    "error" => "unknown_user",
                    "message" => "De gegeven gebruiker bestaat niet."
                );
            }
        }

        public function getId($identifier, $byIdAllowed = true) {
            if (is_numeric($identifier) && intval($identifier) === 0) return 0;
            $sql = "SELECT `id` FROM `" . DATABASE_TABLE_PREFIX . "users` WHERE `email`='${identifier}'";
            if ($this->policy->get('usernames-enabled') == '1') {
                $sql .= " OR `username`='${identifier}'";
            }

            if ($byIdAllowed) {
                $sql .= " OR `id`='${identifier}'";
            }

            $res = $this->db->query($sql);
            if ($res->num_rows > 0) {
                return intval($res->fetch_assoc()['id']);
            } else {
                return NULL;
            }
        }

        // USER META

        public function metaGet($user, $name) {
            $user = $this->getId($user);
            if (!$user) return NULL;
            $res = $this->db->query("SELECT * FROM `" . DATABASE_TABLE_PREFIX . "usermeta` WHERE `name`='${name}' AND `user`='${user}'");
            if ($res->num_rows > 0) {
                return $res->fetch_assoc()['value'];
            } else {
                return NULL;
            }
        }

        public function metaList($user, $limit = NULL) {
            $user = $this->getId($user);
            if (!$user) return array();
            $res = $this->db->query("SELECT * FROM `" . DATABASE_TABLE_PREFIX . "usermeta` WHERE `user`='${user}'" . (\is_int($limit) ? " LIMIT ${limit}" : ''));
            if ($res->num_rows > 0) {
                return $res->fetch_all(MYSQLI_ASSOC);
            } else {
                return array();
            }
        }

        public function metaExists($user, $name) {
            $user = $this->getId($user);
            if (!$user) return false;
            $res = $this->db->query("SELECT * FROM `" . DATABASE_TABLE_PREFIX . "usermeta` WHERE `name`='${name}' AND `user`='${user}'");
            if ($res->num_rows > 0) {
                return true;
            } else {
                return false;
            }
        }

        public function metaSet($user, $name, $value) {
            $user = $this->getId($user);
            if (!$user || $user->id == 0) return;
            if ($this->metaExists($user, $name)) {
                $this->db->query("UPDATE `" . DATABASE_TABLE_PREFIX . "usermeta` SET `value`='${value}' WHERE `name`='${name}' AND `user`='${user}'");
            } else {
                $this->db->query("INSERT INTO `" . DATABASE_TABLE_PREFIX . "usermeta` (`name`, `user`, `value`) VALUES ('${name}', '${user}', '${value}')");
            }

            $this->db->query("UPDATE `" . DATABASE_TABLE_PREFIX . "users` SET `updated`=CURRENT_TIMESTAMP() WHERE `id`=${user}");
        }

        public function metaDelete($user, $name) {
            $user = $this->getId($user);
            if (!$user || $user->id == 0) return;
            $this->db->query("DELETE FROM `" . DATABASE_TABLE_PREFIX . "usermeta` WHERE `name`='${name}' AND `user`='${user}'");
            $this->db->query("UPDATE `" . DATABASE_TABLE_PREFIX . "users` SET `updated`=CURRENT_TIMESTAMP() WHERE `id`=${user}");
        }

        public function purgeMeta($user) {
            $user = $this->getId($user);
            if (!$user || $user->id == 0) return;
            $this->db->query("DELETE FROM `" . DATABASE_TABLE_PREFIX . "usermeta` WHERE `user`='${user}'");
            $this->db->query("UPDATE `" . DATABASE_TABLE_PREFIX . "users` SET `updated`=CURRENT_TIMESTAMP() WHERE `id`=${user}");
        }
    }

    class PasswordPolicies extends ObjectPropertyWorker {
        public function __construct() {
            $this->init('pb-password', 'policies');
            $this->lockProperty("NONE", "score=0");
            $this->lockProperty("WEAK", "score=0.6,length");
            $this->lockProperty("MEDIUM", "score=0.8,uppercase,lowercase,length");
            $this->lockProperty("STRONG", "score=1");
            $this->lockPurge();
        }
    }

    class UserPermissions {
        private $db;
        private $roles;
        private $users;
        private $relations;
        private $permissions;

        public function __construct() {
            $this->db = new \Library\Database;
            $this->users = new Users;
            $this->roles = new \Library\Roles;
            $this->relations = new \Library\Relations;
            $this->permissions = new \Library\Permissions;
        }

        public function grant($user, $permission) {
            $id = $this->users->getId($user);
            var_dump($id);
            if ($id === false) return false;
            return $this->permissions->grant("user", $id, $permission);
        }

        public function reject($user, $permission) {
            $id = $this->users->getId($user);
            if ($id === false) return false;
            return $this->permissions->reject("user", $id, $permission);
        }

        public function clear($user, $permission) {
            $id = $this->users->getId($user);
            if ($id === false) return false;
            return $this->permissions->clear("user", $id, $permission);
        }

        public function check($user, $permission, $extendedResult = false) {
            $id = $this->users->getId($user);
            if ($id === false) return false;
            $roles = $this->relations->list(array(
                "type" => 'user:role',
                "origin" => $id,
                "order" => "DESC"
            ));
            
            $grantSize = 0;
            $rejectSize = 0;

            foreach($roles as $role) {
                $role = (array) $role;
                $res = $this->permissions->check("role", $role['id'], $permission, true);
                if ($res->grantSize > $grantSize) $grantSize = $res->grantSize;
                if ($res->rejectSize > $rejectSize) $rejectSize = $res->rejectSize;
            }

            $res = $this->permissions->check("user", $id, $permission, true);
            if ($res->grantSize > $grantSize) $grantSize = $res->grantSize;
            if ($res->rejectSize > $rejectSize) $rejectSize = $res->rejectSize;

            if ($extendedResult) {
                return (object) array(
                    "granted" => $grantSize > $rejectSize,
                    "grantSize" => $grantSize,
                    "rejectSize" => $rejectSize
                );
            } else {
                return $grantSize > $rejectSize;
            }
        }

        public function list($input, $checkWildcards = true) {
            if (is_numeric($input) || is_string($input)) {
                $id = $this->users->getId($input);
                if ($id === false) return false;
                return $this->permissions->list(array(
                    "target" => "user:" . $id
                ));
            } else {
                if (!isset($input['target']) && !isset($input['targetType'])) $input['targetType'] = 'user';
                return $this->permissions->list($input, $checkWildcards);
            }
        }

        public function find($user, $permission) {
            $id = $this->users->getId($user);
            if ($id === false) return false;
            return $this->permissions->find("user", $id, $permission);
        }
    }