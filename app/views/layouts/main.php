<?php
use yii\easyii\modules\catalog\api\Catalog;
use yii\easyii\modules\shopcart\api\Shopcart;
use yii\easyii\modules\text\api\Text;
use yii\easyii\modules\page\api\Page;
use yii\helpers\Html;
use yii\helpers\Url;

$contact = Page::get('footer-contact-text');
$horizontalnav = Page::get('horizontal-nav');
$verticalnav = Page::get('vertical-nav');
$profile = Page::get('profile-text');

$asset = \app\assets\AppAsset::register($this);
$goodsCount = count(Shopcart::goods());
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
  <head>
    <meta charset="<?= Yii::$app->charset ?>">
    <?= Html::csrfMetaTags() ?>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/favicon.ico" type="image/x-icon">
    <title><?= Html::encode($this->title) ?></title>
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="<?= Yii::$app->homeUrl ?>assets/b7d4a69c/stylesheets/8ddb01bd.main.css"/>
    <link rel="stylesheet" href="<?= Yii::$app->homeUrl ?>assets/b7d4a69c/stylesheets/jquery-ui.css"/>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <!-- Google fonts -->
    <script type="text/javascript">
      WebFontConfig = {
        google: { families: [ 'Arvo:700:latin', 'Open+Sans:400,600,700:latin' ] }
      };
      (function() {
        var wf = document.createElement('script');
        wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
          '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
        wf.type = 'text/javascript';
        wf.async = 'true';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(wf, s);
      })();
    </script>
  </head>
  <body>
<div class="top">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-sm-6">
        <div class="top__slogan">
          <?= Text::get('info-text') ?>
        </div>
      </div>
    </div>
  </div>
</div>
<header class="header">
  <div class="container">
    <div class="row">
      <div class="col-xs-10  col-md-3">
        <div class="header-logo">
          <a href="<?= Yii::$app->homeUrl ?>"><img alt="Logo" src="<?= $asset->baseUrl ?>/images/logo.png" width="200" height="90"></a>
        </div>
      </div>
      <div class="col-xs-2  visible-sm  visible-xs">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle  collapsed" data-toggle="collapse" data-target="#collapsible-navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
      </div>
      <div class="col-xs-12  col-md-7">
        <nav class="navbar  navbar-default" role="navigation">
		  <!-- Collect the nav links, forms, and other content for toggling -->
		  <div class="collapse  navbar-collapse" id="collapsible-navbar">
			<?= $horizontalnav->text ?>
			<!-- search for mobile devices -->
			<form action="#" method="post" class="visible-xs  visible-sm  mobile-navbar-form" role="form">
			  <div class="input-group">
				<input type="text" class="form-control" placeholder="Search">
				<span class="input-group-addon">
				  <button type="submit" class="mobile-navbar-form__appended-btn"><span class="glyphicon  glyphicon-search  glyphicon-search--nav"></span></button>
				</span>
			  </div>
			</form>
		  </div><!-- /.navbar-collapse -->
		</nav>
      </div>
      <div class="col-xs-12  col-md-2  hidden-sm  hidden-xs">
        <!-- Cart in header -->
		<div class="header-cart">
			<span class="header-cart__text--price"><span class="header-cart__text">CART</span> <?php if($goodsCount > 0) : ?><?= Shopcart::cost() ?><?php else : ?>Empty<?php endif; ?></span>
			  <a href="<?= Url::to(['/shopcart']) ?>" class="header-cart__items">
				<span class="header-cart__items-num">
				<?php if($goodsCount > 0) : ?>
					<?= $goodsCount ?> <?= $goodsCount > 1 ? '' : '' ?>
				<?php else : ?>
				0
				<?php endif; ?>
				</span>
			  </a>
		</div>
      </div>
    </div>
  </div>
  <!--Search open pannel-->
  <div class="search-panel">
    <div class="container">
      <div class="row">
        <div class="col-sm-11">
          <form class="search-panel__form" action="search-results.html">
            <button type="submit"><span class="glyphicon  glyphicon-search"></span></button>
            <input type="text" name="s" class="form-control" placeholder="Enter your search keyword">
          </form>
        </div>
        <div class="col-sm-1">
          <div class="search-panel__close  pull-right">
            <a href="#" class="js--toggle-search-mode"><span class="glyphicon  glyphicon-circle  glyphicon-remove"></span></a>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
	<?php $this->beginBody() ?>
	<?= $content ?>
  <footer class="js--page-footer">
    <div class="footer-widgets">
      <div class="container">
        <div class="row">
          <div class="col-xs-12  col-sm-3">
            <div class="footer-widgets__social">
				<?= $profile->text ?>
            </div>
          </div>
          <div class="col-xs-12  col-sm-3">
            <nav class="footer-widgets__navigation">
              <div class="footer-wdgets__heading--line">
                <h4 class="footer-widgets__heading"><?= $verticalnav->title ?></h4>
              </div>
			  <?= $verticalnav->text ?>
            </nav>
          </div>
          <div class="col-xs-12  col-sm-3">
            <div class="footer-widgets__navigation">
              <div class="footer-wdgets__heading--line">
                <h4 class="footer-widgets__heading">Categories</h4>
              </div>
			  <?php foreach(Catalog::cats() as $item) : ?>
              <?= Html::a($item->title, ['/shop/cat', 'slug' => $item->slug], ['class' => 'tag']) ?>
			  <?php endforeach; ?>
            </div>
          </div>
          <div class="col-xs-12  col-sm-3">
            <div class="footer-widgets__navigation">
                <div class="footer-wdgets__heading--line">
                  <h4 class="footer-widgets__heading"><?= $contact->title ?></h4>
                </div>
                <?= $contact->text ?>
              </div>
            </div>
        </div>
      </div>
    </div>
    <div class="footer">
      <div class="container">
        <div class="row">
          <div class="col-xs-12  col-sm-6">
            <div class="footer__text--link">
              <a class="footer__link" href="/">Detolixir</a> © Copyright 2016.
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>
	<?php $this->endBody() ?>
    <script type="text/javascript">
      function downloadJSAtOnload() {
        var element = document.createElement("script");
        element.src = "js/main.js";
        document.body.appendChild(element);
      }
      if (window.addEventListener)
        window.addEventListener("load", downloadJSAtOnload, false);
      else if (window.attachEvent)
        window.attachEvent("onload", downloadJSAtOnload);
      else window.onload = downloadJSAtOnload;
    </script>
  </body>
</html>
<?php $this->endPage() ?>