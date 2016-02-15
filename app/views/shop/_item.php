<?php
use yii\helpers\Html;
use yii\helpers\Url;
?>
<div class="col-xs-6 col-sm-3  js--isotope-target js--cat-1" data-price="<?= $item->price ?>">
  <div class="products__single">
    <figure class="products__image">
      <a href="<?= Url::base(), '/shop/view/', $item->slug ?>">
        <img alt="#" class="product__image" src="<?= Url::base(), $item->thumb(263, 334) ?>">
      </a>
      <div class="product-overlay">
        <a class="product-overlay__more" href="<?= Url::base(), '/shop/view/', $item->slug ?>">
          <span class="glyphicon glyphicon-search"></span>
        </a>
        <a class="product-overlay__cart" href="<?= Url::base(), '/shop/view/', $item->slug ?>#buy">
          +<span class="glyphicon glyphicon-shopping-cart"></span>
        </a>
        <div class="product-overlay__stock">
          <span class="in-stock">&bull;</span> <span class="in-stock--text">Ada</span>
        </div>
      </div>
    </figure>
    <div class="row">
      <div class="col-xs-9">
        <h5 class="products__title">
          <a class="products__link" href="<?= Url::base(), '/shop/view/', $item->slug ?>"><?= $item->title ?></a>
        </h5>
      </div>
      <div class="col-xs-3">
        <div class="products__price">
          <?= $item->price ?>
        </div>
      </div>
    </div>
    <div class="products__category">
      <?= $item->cat->title ?>
    </div>
  </div>
</div>
