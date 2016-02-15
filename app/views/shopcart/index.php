<?php
use yii\easyii\modules\page\api\Page;
use yii\easyii\modules\shopcart\api\Shopcart;
use yii\easyii\modules\text\api\Text;
use yii\helpers\Html;
use yii\helpers\Url;

$asset = \app\assets\AppAsset::register($this);

$page = Page::get('checkout-page');

$this->title = $page->seo('title', $page->model->title);
$this->params['breadcrumbs'][] = $page->model->title;
?>
<div class="breadcrumbs">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <nav>
          <ol class="breadcrumb">
            <li><a href="/">Home</a></li>
            <li class="active">Shopcart</li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
</div>
<div class="container" style="padding-bottom:40px">
<?php if(count($goods)) : ?>
    <div class="row">
	<h1 class="center" style="margin-top:0;"><?= $page->text ?></h1>
      <hr class="shop_divider">
	  </div>
        <div class="col-md-6">
            <?= Html::beginForm(['/shopcart/update'])?>
            <table class="table">
                <thead>
                <tr>
                    <th>Item</th>
                    <th width="100">Quantity</th>
                    <th width="120">Unit Price</th>
                    <th width="100">Total</th>
                    <th width="30"></th>
                </tr>
                </thead>
                <tbody>
                <?php foreach($goods as $good) : ?>
                    <tr>
                        <td>
                            <?= Html::a($good->item->title, ['/shop/view', 'slug' => $good->item->slug]) ?>
                            <?= $good->options ? "($good->options)" : '' ?>
                        </td>
                        <td><?= Html::textInput("Good[$good->id]", $good->count, ['class' => 'form-control input-sm']) ?></td>
                        <td>
                            <?php if($good->discount) : ?>
                                <del class="text-muted "><small><?= $good->item->oldPrice ?></small></del>
                            <?php endif; ?>
                            <?= $good->price ?>
                        </td>
                        <td>Rp. <?= $good->price * $good->count ?></td>
                        <th><?= Html::a('<i class="glyphicon glyphicon-trash text-danger"></i>', ['/shopcart/remove', 'id' => $good->id], ['title' => 'Remove item']) ?></th>
                    </tr>
                <?php endforeach; ?>
                <tr>
                    <td colspan="5" class="text-right">
                        <h3>Total belanjaan Anda Rp. <?= Shopcart::cost() ?></h3>
                    </td>
                </tr>
                </tbody>
            </table>
            <?= Html::submitButton('<i class="glyphicon glyphicon-refresh"></i> Update', ['class' => 'btn btn-warning pull-right']) ?>
            <?= Html::endForm()?>
        </div>
        <div class="col-md-5 col-md-offset-1">
                <?= Shopcart::form(['successUrl' => Url::to('/shopcart/success')])?>
        </div>
<?php else : ?>
		<h1 class="center" style="margin-top:0;"><?= Text::get('empty-cart') ?></h1>
        <div class="col-md-6 col-md-offset-4">
			<img src="<?= $asset->baseUrl ?>/images/empty.jpg" alt="Belanjaan Anda kosong" title="Belanjaan Anda kosong" />
		</div>
<?php endif; ?>
    </div>
