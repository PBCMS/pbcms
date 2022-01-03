<?php
    namespace Library;

    use Registry\Store;

    class Router {
        protected static $preferredLanguage = NULL;
        protected static $virtualPath = NULL;
        protected static $currentController;

        protected static $rawController = 'root';
        protected static $rawMethod = '__index';
        protected static $controller = 'Root';
        protected static $method = '__index';
        protected static $params = [];
        protected static $url = '/';
        protected $db;

        private static $executed = false;
        private static $initialized = false;

        public function __construct($url = '') {
            $this->db = new Database;
            if (!self::$initialized) {
                self::$initialized = true;
                if (isset($_GET['url'])) self::$url = $_GET['url'];
                if ($url != '') self::$url = $url;

                $this->validateUrl();
                $this->fillProperties();
            }
        }

        public function refactorRequest($url) {
            if (self::$executed) return false;
            if (self::$controller == 'PbApi' || self::$controller == 'PbAuth' || self::$controller == 'PbDashboard' || self::$controller == 'PbLoader' || self::$controller == 'PbPubfiles') {
                return false;
            }
            
            self::$preferredLanguage = NULL;
            self::$virtualPath = NULL;
            self::$rawController = 'root';
            self::$rawMethod = '__index';
            self::$controller = 'Root';
            self::$method = '__index';
            self::$params = [];
            self::$url = $url;

            $this->validateUrl();
            $this->fillProperties();
            $this->processRequest();
            return true;
        }

        public function langPref() {
            return self::$preferredLanguage;
        }

        public function virtPath() {
            return self::$virtualPath;
        }

        public function documentRequest() {
            return (object) array(
                "controller" => self::$controller,
                "method" => self::$method,
                "params" => self::$params,
                "url" => self::$url,

                "preferred_language" => self::$preferredLanguage,
                "virtual_path" => self::$virtualPath
            );
        }

        public function processRequest($virtualIndex = 0) {
            if (self::$executed) return false;
            if ($this->controllerExists(self::$controller)) {
                $this->loadController(self::$controller);
                $class = 'Controller\\' . self::$controller;
                self::$currentController = new $class;

                if (method_exists(self::$currentController, $this->prepareFunctionNaming(self::$method))) {
                    return;
                }
            }

            $virtualPaths = $this->matchVirtualPath();
            if (count($virtualPaths) > 0 && isset($virtualPaths[$virtualIndex])) {
                self::$rawController = 'root';
                self::$rawMethod = '__index';
                self::$controller = 'Root';
                self::$method = '__index';
                self::$params = [];

                $virtual = $virtualPaths[$virtualIndex]['path'];
                $target = $virtualPaths[$virtualIndex]['target'];
                $rest = array_slice($this->processUrl(self::$url), count($this->processUrl($virtual)));
                $final = join('/', $this->processUrl($target)) . '/' . join('/', $rest);

                self::$virtualPath = $virtualPaths[$virtualIndex]['id'];
                self::$preferredLanguage = $virtualPaths[$virtualIndex]['lang'];
                Store::set('router-virtual-path', $virtualPaths[$virtualIndex]['id']);
                Store::set('router-preferred-language', $virtualPaths[$virtualIndex]['lang']);
                $this->fillProperties($final);
                $this->processRequest($virtualIndex + 1);
            } else {
                array_unshift(self::$params, self::$rawMethod);
                self::$rawMethod = NULL;
                self::$method = NULL;
                self::$virtualPath = NULL;
                self::$preferredLanguage = NULL;
                Store::delete('router-virtual-path');
                Store::delete('router-preferred-language');

                if (!$this->controllerExists(self::$controller)) {
                    array_unshift(self::$params, self::$rawController);
                    self::$rawController = NULL;
                    self::$controller = NULL;
                }

                return;
            }
        }

        public function executeRequest() {
            if (self::$executed) return false;
            if (!self::$controller) {
                $this->displayError(404);
            }

            if (!self::$method) {
                if (method_exists(self::$currentController, '__error')) {
                    self::$currentController->__error(404);
                } else {
                    $this->displayError(404);
                }
            } else {
                self::$currentController->{$this->prepareFunctionNaming(self::$method)}(self::$params);
            }
            
            self::$executed = true;
        }

        private function fillProperties($orig = '') {
            if (self::$executed) return false;
            $index = 0;
            if ($orig == '') $orig = self::$url;
            $url = $this->processUrl($orig);
            if (count($url) < 1) return NULL;

            foreach($url as $segment) if (substr($segment, 0, 2) == '__') $this->displayError(403);

            if ($this->controllerExists($url[$index])) {
                self::$rawController = $url[$index];
                self::$controller = $this->prepareFunctionNaming($url[$index]);
                unset($url[$index]);
                $index++;
            }

            if (count($url) < 1) return;
            self::$rawMethod = $url[$index];
            self::$method = $this->prepareFunctionNaming($url[$index]);
            unset($url[$index]);
            $index++;
            self::$params = array_values($url);
            return;
        }
        
        public function matchVirtualPath($orig = '') {
            if ($orig == '') $orig = self::$url;
            $url = $this->processUrl($orig);

            $sql = "SELECT * FROM `" . DATABASE_TABLE_PREFIX . "virtual-paths` WHERE";

            if (count($url) == 0) {
                $sql .= " `path`='/'";
            }

            while(count($url) > 0) {
                $sql .= " `path`='" . join('/', $url) . "'";
                $sql .= " OR `path`='/" . join('/', $url) . "'";
                $sql .= " OR `path`='/" . join('/', $url) . "/'";
                $sql .= " OR `path`='" . join('/', $url) . "/'";
                $url = array_slice($url, 0, -1);

                if (count($url) > 0) {
                    $sql .= ' OR';
                }
            }

            $result = $this->db->query($sql);
            $fetched = $result->fetch_all(MYSQLI_ASSOC);

            usort($fetched, function($a, $b) {
                return strlen($b['path']) <=> strlen($a['path']);
            });

            return $fetched;
        }

        public function matchReversedVirtualPath($orig = '', $lang = '') {
            if ($orig == '' || !$orig) $orig = self::$url;
            $url = $this->processUrl($orig);
            if (count($url) < 1) return array();

            $sql = "SELECT * FROM `" . DATABASE_TABLE_PREFIX . "virtual-paths` WHERE (";

            while(count($url) > 0) {
                $sql .= " `target`='" . join('/', $url) . "'";
                $url = array_slice($url, 0, -1);

                if (count($url) > 0) {
                    $sql .= ' OR';
                }
            }

            $sql .= ')';

            if ($lang !== '') {
                $sql .= " AND `lang`='${lang}'";
            }

            $result = $this->db->query($sql);
            $fetched = $result->fetch_all(MYSQLI_ASSOC);

            usort($fetched, function($a, $b) {
                return strlen($b['path']) <=> strlen($a['path']);
            });

            return $fetched;
        }

        public function urlTranslations($orig = '', $lang = '') {
            if ($orig == '' || !$orig) $orig = self::$url;
            $url = $this->processUrl($orig);
            if (count($url) < 1) return array();

            $matches = $this->matchReversedVirtualPath($orig, $lang);
            $results = array();

            foreach($matches as $match) {
                $virtual = $match['path'];
                $rest = array_slice($url, count($this->processUrl($virtual)));
                $match['translation'] = join('/', $this->processUrl($virtual)) . '/' . join('/', $this->processUrl(join('/', $rest)));
                array_push($results, $match);
            }

            return $results;
        }

        public function attemtUrlTranslation($orig = '', $lang = '') {
            $translations = self::$urlTranslations($orig, $lang);
            if (count($translations) == 0) return $orig;
            return $translations[0]['translation'];
        }

        public function processUrl($url) {
            $url = explode('/', $url);
            $url = array_filter($url);
            return $url;
        }

        private function validateUrl() {
            if (substr(self::$url, 0, 1) == '/' && strlen(self::$url) > 1) {
                self::$url = substr(self::$url, 1);
            }
        }

        public function prepareFunctionNaming($str) {
            $str = str_replace('-', ' ', $str);
            $str = ucwords($str);
            $str = str_replace(' ', '', $str);
            return $str;
        }

        public function controllerExists($controller) {
            if (file_exists(APP_DIR . '/controllers/' . $this->prepareFunctionNaming($controller) . '.php')) {
                return true;
            } else if (file_exists(DYNAMIC_DIR . '/controllers/' . $this->prepareFunctionNaming($controller) . '.php')) {
                return true;
            } else {
                return false;
            }
        }

        public function loadController($controller) {
            if (file_exists(APP_DIR . '/controllers/' . $this->prepareFunctionNaming($controller) . '.php')) {
                require_once APP_DIR . '/controllers/' . $this->prepareFunctionNaming($controller) . '.php';
            } else if (file_exists(DYNAMIC_DIR . '/controllers/' . $this->prepareFunctionNaming($controller) . '.php')) {
                require_once DYNAMIC_DIR . '/controllers/' . $this->prepareFunctionNaming($controller) . '.php';
            } else {
                return false;
            }
            
        }

        public function displayError($error, $short = null, $message = null) {
            self::$executed = true;
            $controller = new \Library\Controller;
            $controller->__displayError($error, $short, $message);
            die;
        }
    }