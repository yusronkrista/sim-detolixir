<?php
use yii\easyii\modules\catalog\api\Catalog;
use yii\easyii\modules\page\api\Page;
use yii\helpers\Html;
use yii\helpers\Url;

$page = Page::get('shop-page');

$this->title = $page->seo('title', $page->model->title);

function renderNode($node){
    if(!count($node->children)){
        $html = '<li>'.Html::a($node->title, ['/shop/cat', 'slug' => $node->slug]).'</li>';
    } else {
        $html = '<li>'.$node->title.'</li>';
        $html .= '<ul>';
        foreach($node->children as $child) $html .= renderNode($child);
        $html .= '</ul>';
    }
    return $html;
}
?>
<div class="breadcrumbs">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <nav>
          <ol class="breadcrumb">
            <li><a href="/">Home</a></li>
            <li class="active">Shop</li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
</div>
<div class="container">
  <div class="row">
    <div class="col-xs-12  col-sm-3">
      <aside class="sidebar  sidebar--shop">
        <div class="shop-filter">
          <h3 class="sidebar__title">Categories</h3>
		  <hr class="shop__divider">
          <ul class="nav  nav--filter">
          <?php foreach(Catalog::tree() as $node) echo renderNode($node); ?>
          </ul>
          <hr class="divider">
        </div>
      </aside>
    </div>
    <div class="col-xs-12  col-sm-9">
      <div class="grid">
        <ul class="pagination  shop__amount-filter">
          <li>
            <h3 class="sidebar__title">Catalog <span class="light">Product</span></h3>
          </li>
        </ul>
        <div class="shop__sort-filter">
          <select class="js--isotope-sorting  btn  btn-shop">
              <option value='{"sortBy":"price", "sortAscending":"true"}'>By Price (Low to High) &uarr;</option>
              <option value='{"sortBy":"price", "sortAscending":"false"}'>By Price (High to Low) &darr;</option>
              <option value='{"sortBy":"name", "sortAscending":"true"}'>By Name (Low to High) &uarr;</option>
              <option value='{"sortBy":"name", "sortAscending":"false"}'>By Name (High to Low) &darr;</option>
          </select>
        </div>
        <hr class="shop__divider">
        <div class="row  js--isotope-container">		
        <?php foreach(Catalog::last(999) as $item) : ?>
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
        <?php endforeach; ?>
          <div class="clearfix  hidden-xs"></div>
        </div>
      </div>
    </div>
  </div>
</div>
