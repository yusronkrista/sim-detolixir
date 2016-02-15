<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\EasyiiKurir */

$this->title = 'Tambah kurir baru';
$this->params['breadcrumbs'][] = ['label' => 'Easyii Kurirs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
