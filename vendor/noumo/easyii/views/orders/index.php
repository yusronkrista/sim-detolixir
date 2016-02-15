<?php
use yii\helpers\Html;
use yii\grid\GridView;

$this->title = 'Shopcart Orders';
$this->params['breadcrumbs'][] = $this->title;
?>
<?= $this->render('_menu') ?>
<?php if($dataProvider->count > 0) : ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
		'tableOptions'=>['class'=>'table table-condensed'],
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            // 'order_id',
            'name',
            'address',
            'date',
            'payment',
            'kurir',
            // 'phone',
            // 'email:email',
            // 'comment',
            // 'remark',
            // 'access_token',
            // 'ip',
            // 'time:datetime',
            // 'new',
            // 'status',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
<a class="btn btn-success" href="orders/export1">Export seluruh data (XLS)</a>
<a class="btn btn-info" href="orders/export2">Export data produksi untuk hari ini (XLS)</a>
<?php else : ?>
    <p><?= Yii::t('easyii', 'No records found') ?></p>
<?php endif; ?>