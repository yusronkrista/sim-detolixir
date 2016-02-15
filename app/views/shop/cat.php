<?php
use yii\easyii\modules\catalog\api\Catalog;
use yii\easyii\modules\page\api\Page;
use yii\helpers\Html;
use yii\helpers\Url;

$page = Page::get('shop-page');

$this->title = $cat->seo('title', $cat->model->title);

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
            <li class="active"><?= $cat->seo('h1', $cat->title) ?></li>
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
            <h3 class="sidebar__title"><?= $cat->seo('h1', $cat->title) ?></h3>
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
        <?php if(count($items)) : ?>
            <?php foreach($items as $item) : ?>
                <?= $this->render('_item', ['item' => $item]) ?>
            <?php endforeach; ?>
        <?php else : ?>
		<div class="col-lg-12 js--isotope-target js--cat-1">
			<div class="products__single">
				<figure class="products__image">
					<h2>Kategori kosong. Pilih <a href="/shop/">kategori</a> lain</h2>
				</figure>
			</div>
		</div>
        <?php endif; ?>
        <div class="clearfix  hidden-xs"></div>
        </div>
        <hr class="shop__divider">
        <div class="shop__pagination">
			<?= $cat->pages() ?>
        </div>
      </div>
    </div>
  </div>
</div>
