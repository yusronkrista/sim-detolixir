<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\EasyiiKurir */

$this->title = 'Update Easyii Kurir: ' . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Easyii Kurirs', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->kurir_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
