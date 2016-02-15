<?php
use yii\easyii\modules\page\api\Page;
use yii\easyii\modules\shopcart\api\Shopcart;
use yii\helpers\Html;

$page = Page::get('success-page');

$this->title = $page->seo('title', $page->model->title);
$this->params['breadcrumbs'][] = $page->model->title;
?>
<div class="breadcrumbs">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <nav>
          <ol class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li class="active">Shop</li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
</div>
<div class="woocommerce  push-down-30">
  <div class="container">
    <h3><span class="light">Transaksi</span> Berhasil</h3>
    <hr>
    <?= $page->text ?>
    <div class="row">
      <div class="col-xs-12  col-sm-6">
        <header class="title">
          <h3><span class="light">ATM</span> Mandiri</h3>
        </header>
        <address>
          <p style="font-size:16px">
            a/n Detolixir Surabaya<br>
            1230-0045-6789-0
          </p>
        </address>
      </div>
      <div class="col-xs-12  col-sm-6">
        <header class="title">
          <h3><span class="light">ATM</span> BCA</h3>
        </header>
        <address>
          <p style="font-size:16px">
            a/n Detolixir Surabaya<br>
            1230-0045-6789-0
          </p>
        </address>
      </div>
    </div>
    <hr class="divider">
  </div>
</div>
