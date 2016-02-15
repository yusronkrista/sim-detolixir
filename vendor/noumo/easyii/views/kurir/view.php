<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\EasyiiKurir */

$this->title = 'Data lengkap '. $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Kurir', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'kurir_id',
            'name',
            'address',
            'phone',
        ],
    ]) ?>
    <p>
        <?= Html::a('Rubah', ['update', 'id' => $model->kurir_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Hapus', ['delete', 'id' => $model->kurir_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>
