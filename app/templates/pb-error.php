<?php
    /**
     * Template: pb-error
     * Authors: The PBCMS developers
     * Description: This template is used for the error pages.
     * 
     * ==== REQUIRED DATA ATTRIBUTES ====
     * - title;         The title of the page. " - SITE TITLE" will be put behind the title.
     * - description;   The description of the page. Used for meta generation.
     * - copyright;     The copyright message placed at the bottom of the page.
     * 
     * ==== OPTIONAL DATA ATTRIBUTES ====
     * - meta;          Additional meta tags to be included by the Meta Batch definition.
     * - head;          Additional head assets to be included by the Assets Batch function definition. (eg. styles)
     * - body;          Additional body assets to be included by the Assets Batch function definition. (eg. scripts)
     */

    use Library\Meta;
    $meta = new Meta;
    $meta->set('robots', 'index, nofollow');
    $meta->set('title', $data['title'] . ' - ' . SITE_TITLE);
    $meta->set('description', $data['description']);
    if (isset($data['meta'])) $meta->batch($data['meta']);

    Core::SystemAssets();
    $assets = new \Library\Assets;
    $assets->registerHead('style', 'https://fonts.gstatic.com', array("rel" => "preconnect"));
    $assets->registerHead('style', 'https://fonts.googleapis.com/css2?family=Didact+Gothic&display=swap');
    $assets->registerHead('style', 'pbcms-system-pages.css', array("origin" => "pubfiles"));
    $assets->registerHead('style', 'pbcms-portal-pages.css', array("origin" => "pubfiles"));

    if (isset($data['head'])) $assets->registerBatch('head', $data['head']);
    if (isset($data['body'])) $assets->registerBatch('body', $data['body']);
?>

<!DOCTYPE html>
    <html lang="en">
    <head>
        <?php 
            echo $meta->generate(); 
            echo $assets->generateHead();
        ?>
    </head>
    <body>
        <div class="pbcms-system-display error-display portal">
            <div class="top-bar">
                <div class="logo-container">
                    <img src="<?php echo SITE_LOCATION; ?>/pb-pubfiles/img/pb-logos/full-dark.png" alt="PBCMS Logo (Full, Dark)">
                </div>
                <h1 class="portal-subtitle">
                    <?php echo $data['subtitle']; ?>
                </h1>
            </div>
            <div class="content">
                <?php echo $content; ?>
            </div>
        </div>

        <div class="page-copyright">
            <p>
                <a href="<?php echo (isset($_GET['referrer']) ? $_GET['referrer'] : SITE_LOCATION); ?>">Back to site</a> - <?php echo $data['copyright']; ?>, Powered by <a href="https://pbcms.io" target="_blank">PBCMS</a>.
            </p>
        </div>
        
        <?php
            echo $assets->generateBody();
        ?>
    </body>
</html>