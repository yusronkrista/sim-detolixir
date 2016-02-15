<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\EasyiiKurirSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Kurir';
$this->params['breadcrumbs'][] = $this->title;
?>
<ul class="nav nav-pills">
    <li class="active">
        <a href="/admin/kurir/create">Tambah kurir baru</a>
    </li>
</ul>
<?php if($dataProvider->count > 0) : ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
		'tableOptions'=>['class'=>'table table-condensed'],
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'name',
            'address',
            'phone',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
<?php else : ?>
    <p><?= Yii::t('easyii', 'No records found') ?></p>
<?php endif; ?>