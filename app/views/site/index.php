<?php
use yii\easyii\modules\catalog\api\Catalog;
use yii\easyii\modules\text\api\Text;
use yii\easyii\modules\page\api\Page;
use yii\helpers\Url;

$asset = \app\assets\AppAsset::register($this);

$page = Page::get('index-page');

$why1 = Page::get('why-1');
$why2 = Page::get('why-2');
$why3 = Page::get('why-3');

$this->title = $page->seo('title', $page->model->title);
?>
<!-- jumbotron -->
<div class="jumbotron  jumbotron--business  js--add-gradient">
  <div class="container">
    <div class="row">
      <div class="col-xs-12  col-md-8">
        <div class="jumbotron__container">
          <div class="jumbotron__title  jumbotron__title--main">
            <?= Text::get('welcome-text') ?>
          </div>
          <div class="jumbotron__subtitle  jumbotron__subtitle--main  push-down-30">
            <?= $page->text ?>
          </div>
          <a class="btn btn-warning" href="<?= Yii::$app->homeUrl ?>shop/">Start Shopping</a> &nbsp;
        </div>
      </div>
      <div class="col-xs-10  col-xs-offset-1  col-sm-6  col-sm-offset-3  col-md-4  col-md-offset-0  col-lg-3  col-lg-offset-1">
        <div class="jumbotron__opening-time">
          <!-- Opening Times Widget -->
<div class="sidebar-item  opening-time  light-paper-pattern">
  <h3 class="opening-time__title">Opening time</h3>
  <hr class="divider-open-time">
  <div class="time-table  js--timetable">
    <dl class="week-day" data-day="1">
      <dt>
        Senin
      </dt>
      <dd>
        8:00 - 16:00
      </dd>
    </dl>
    <dl class="week-day" data-day="2">
      <dt>
        Selasa
      </dt>
      <dd>
        8:00 - 16:00
      </dd>
    </dl>
    <dl class="week-day" data-day="3">
      <dt>
        Rabu
      </dt>
      <dd>
        8:00 - 16:00
      </dd>
    </dl>
    <dl class="week-day" data-day="4">
      <dt>
        Kamis
      </dt>
      <dd>
        8:00 - 16:00
      </dd>
    </dl>
    <dl class="week-day" data-day="5">
      <dt>
        Jum'at
      </dt>
      <dd>
        8:00 - 16:00
      </dd>
    </dl>
    <dl class="week-day" data-day="6">
      <dt>
        Sabtu
      </dt>
      <dd>
        8:00 - 16:00
      </dd>
    </dl>
    <dl class="week-day  closed" data-day="0">
      <dt>
        Minggu
      </dt>
      <dd>
        CLOSED
      </dd>
    </dl>
  </div>
</div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="container">
  <!-- Title for motivational stories -->
<div class="row">
  <div class="col-xs-12">
    <div class="main__title">
      <h3 class="main__title__text"><?= Text::get('why') ?></h3>
    </div>
  </div>
</div>

<!-- Motivational stories -->
<div class="motivational-stories">
  <div class="row">
    <div class="col-xs-12  col-sm-4  push-down-30">
      <div class="motivational-stories__circle">
        <span class="glyphicon  glyphicon-heart"></span>
      </div>
      <h5><?= $why1->title ?></h5>
      <p><?= $why1->text ?></p>
    </div>
    <div class="col-xs-12  col-sm-4  push-down-30">
      <div class="motivational-stories__circle">
        <span class="glyphicon  glyphicon-leaf"></span>
      </div>
      <h5><?= $why2->title ?></h5>
      <p><?= $why2->text ?></p>
    </div>
    <div class="col-xs-12  col-sm-4  push-down-30">
      <div class="motivational-stories__circle">
        <span class="glyphicon  glyphicon-record"></span>
      </div>
      <h5><?= $why3->title ?></h5>
      <p><?= $why3->text ?></p>
    </div>
  </div>
</div>
</div>
<div class="testimonials  team-slider  light-paper-pattern">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <h3 class="testimonials__title"><span class="light">New</span> Products</h3>
        <div class="push-down-35"></div>
      </div>
    </div>
    <div id="js--team-carousel" class="carousel  slide" data-ride="carousel" data-interval="5000">
      <div class="carousel-inner">
        <div class="item  active">
          <div class="row">
		<?php foreach(Catalog::last(4) as $item) : ?>
            <div class="col-xs-12  col-sm-3">
              <a href="<?= Url::base(), '/shop/view/', $item->slug ?>"><img alt="#" class="product__image  team-image" src="<?= Url::base(), $item->thumb(260, 260) ?>"></a>
              <h5><?= $item->title ?></h5>
			  <span class="team-slider__title"><?= $item->cat->title ?></span>
            </div>
        <?php endforeach; ?>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="testimonials">
  <div class="container">
    <div class="row">
      <div class="col-sm-3  hidden-xs">
        <div class="testimonials__quotes">
          <img alt="#" class="testimonials__quotes--img" src="<?= $asset->baseUrl ?>/images/quotes.png">
        </div>
      </div>
      <div class="col-xs-12  col-sm-6">
        <a href="#js--testimonails-carousel" data-slide="prev"><span class="glyphicon  glyphicon-circle  glyphicon-chevron-left"></span></a>
        <h4 class="testimonials__title"><span class="light">Others</span> About Us</h4>
        <a href="#js--testimonails-carousel" data-slide="next"><span class="glyphicon  glyphicon-circle  glyphicon-chevron-right"></span></a>
        <hr class="divider-dark">
        <div id="js--testimonails-carousel" class="carousel  slide" data-ride="carousel" data-interval="5000">
          <div class="carousel-inner">
            <div class="item  active">
              <q class="testimonials__text">Saya sangat senang menggunakan produk Detolixir, rasanya enak dan efeknya cepat terasa. Saya sudah berlangganan produk ini sejak beberapa bulan terakhir dan Detolixir benar-benar menyehatkan</q><br><br>
              <cite><b>Florence,</b></cite> Atlet Aerobic
            </div>
            <div class="item">
              <q class="testimonials__text">Saya suka menggunakan produk Detolixir karena banyak pilihan rasa, harganya terjangkau dan manfaatnya nyata. Saya akan memakai produk ini hingga waktu yang tidak ditentukan. Terima kasih Detolixir</q><br><br>
              <cite><b>Mark Krik,</b></cite> Traveler
            </div>
            <div class="item">
              <q class="testimonials__text">Saya jatuh cinta sejak pertama kali mengetahui produk ini. Saya tidak bisa mengatakan banyak hal, yang jelas silahkan mencobanya sendiri karena saya sudah mendapatkan manfaatnya. Wow!</q><br><br>
              <cite><b>Yusron Kristanto,</b></cite> Copy Writer
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-3  hidden-xs">
        <div class="testimonials__quotes--rotate">
          <img alt="#" class="testimonials__quotes--img" src="<?= $asset->baseUrl ?>/images/quotes.png">
        </div>
      </div>
    </div>
  </div>
</div>
