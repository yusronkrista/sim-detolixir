<?php
use yii\easyii\modules\catalog\api\Catalog;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
use app\models\AddToCartForm;

$this->title = $item->seo('title', $item->model->title);
$this->params['breadcrumbs'][] = ['label' => 'Shop', 'url' => ['shop/index']];
$this->params['breadcrumbs'][] = ['label' => $item->cat->title, 'url' => ['shop/cat', 'slug' => $item->cat->slug]];
$this->params['breadcrumbs'][] = $item->model->title;

?>
<div class="breadcrumbs">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <nav>
          <ol class="breadcrumb">
            <li><a href="/">Home</a></li>
            <li><a href="/shop/">Shop</a></li>
			<li><a href="<?= Url::base(), '/shop/cat/', $item->cat->slug ?>"><?= $item->cat->title ?></a></li>
            <li class="active"><?= $item->seo('h1', $item->title) ?></li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
</div>
<div class="container">
  <div class="push-down-30">
    <div class="row">
      <div class="col-xs-12 col-sm-4">
        <div class="product-preview">
          <div class="push-down-20">
            <img class="js--product-preview" alt="Single product image" src="<?= Url::base(), $item->thumb(360, 458) ?>">
          </div>
          <div class="clearfix">
			<?php if(count($item->photos)) : ?>
			<?php foreach($item->photos as $photo) : ?>
            <div class="product-preview__thumb">
              <a href="<?= Url::base(), $photo->image ?>" target="_blank">
                <img src="<?= $photo->thumb(66, 82) ?>" alt="Single product thumbnail image" />
              </a>
            </div>
			<?php endforeach;?>
			<?php endif; ?>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-8">
        <div class="products__content">
          <div class="push-down-30"></div>
          <span class="products__category"><?= $item->cat->title ?></span>
		  <h1 class="single-product__title"><?= $item->seo('h1', $item->title) ?></h1>
          <span class="single-product__price">Rp. <?= $item->price ?></span>
          <div class="in-stock--single-product">
            <span class="in-stock">&bull;</span> <span class="in-stock--text">harga satuan</span>
          </div>
          <hr class="bold__divider">
          <div class="single-product__text">
            <?= $item->description ?>
          </div>
          <hr class="bold__divider">
		  <div id="buy">
			<?php if(Yii::$app->request->get(AddToCartForm::SUCCESS_VAR)) : ?>
				<h4 class="text-success"><i class="glyphicon glyphicon-ok"></i> Sudah ditambahkan ke keranjang</h4>
			<?php elseif($item->slug) : ?>
				<br/>
					<?php $form = ActiveForm::begin(['action' => Url::to(['/shopcart/add', 'id' => $item->id])]); ?>
				  <div class="quantity  js--quantity">
					<input type="button" value="-" class="quantity__button  js--minus-one  js--clickable">
					<input type="text" id="addtocartform-count" name="AddToCartForm[count]" value="1" class="quantity__input" required>
					<input type="button" value="+" class="quantity__button  js--plus-one  js--clickable">
				  </div>
					<?= Html::submitButton('<span class="glyphicon glyphicon-plus"></span><span class="glyphicon glyphicon-shopping-cart"></span><span class="single-product__btn-text">Masukkan ke keranjang</span>', ['class' => 'btn btn-primary--transition']) ?>
					<?php ActiveForm::end(); ?>
			<?php endif; ?>
		  </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Navigation -->
  <div class="push-down-30">
    <div class="products-navigation">
      <div class="products-navigation__title">
        <h3><span class="light">Related</span> Products</h3>
      </div>
    </div>
  </div>
  <!-- Products -->
  <div class="push-down-30">
    <div class="row">
        <?php foreach(Catalog::last(4) as $item) : ?>
        <div class="col-xs-6 col-sm-3  js--isotope-target  js--cat-1">
		  <div class="products__single">
			<figure class="products__image">
			  <a href="<?= Url::base(), '/shop/view/', $item->slug ?>">
				<img alt="#" class="product__image" src="<?= Url::base(), $item->thumb(263, 334) ?>">
			  </a>
			  <div class="product-overlay">
				<a class="product-overlay__more" href="<?= Url::base(), '/shop/view/', $item->slug ?>">
				  <span class="glyphicon glyphicon-search"></span>
				</a>
				<a class="product-overlay__cart" href="#">
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
				  <a class="products__link  js--isotope-title" href="<?= Url::base(), '/shop/view/', $item->slug ?>"><?= $item->title ?></a>
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
    </div>
  </div>
</div>
