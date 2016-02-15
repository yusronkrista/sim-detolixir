<?php
use yii\easyii\modules\page\api\Page;

$page = Page::get('about');

$this->title = $page->seo('title', $page->model->title);
$this->params['breadcrumbs'][] = $page->model->title;

$asset = \app\assets\AppAsset::register($this);
?>
<div class="breadcrumbs">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <nav>
          <ol class="breadcrumb">
            <li><a href="/">Home</a></li>
            <li class="active">About Us</li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
</div>
<div class="container">
  <div class="row">
    <div class="col-xs-12" style="padding-bottom:40px">
      <center><img alt="#" src="<?= $asset->baseUrl ?>/images/cover.jpg"></center>
      <h1 class="center"><?= $page->title ?></h1>
      <hr class="divider">
      <div class="text-shrink">
        <?= $page->text ?>
      </div>
      <hr class="divider">
    </div>
  </div>
</div>
