<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$asset = \yii\easyii\assets\EmptyAsset::register($this);
$this->title = Yii::t('easyii', 'Sign in');
?>
<div class="container">
    <div id="wrapper" class="col-md-4 col-md-offset-4 vertical-align-parent">
        <div class="vertical-align-child">
            <div class="text-center" style="padding-bottom:10px">
                <a class="logo" href="/" target="_blank" title="EasyiiCMS homepage">
                    <img src="<?= $asset->baseUrl ?>/img/logo.png">
                </a>
            </div>
            <div class="panel">
                <div class="panel-heading text-center">
                    <?= Yii::t('easyii', 'Login to Panel') ?>
                </div>
                <div class="panel-body">
                    <?php $form = ActiveForm::begin([
                        'fieldConfig' => [
                            'template' => "{beginWrapper}\n{input}\n{hint}\n{error}\n{endWrapper}"
                        ]
                    ])
                    ?>
                        <?= $form->field($model, 'username')->textInput(['class'=>'form-control', 'placeholder'=>Yii::t('easyii', 'Username')]) ?>
                        <?= $form->field($model, 'password')->passwordInput(['class'=>'form-control', 'placeholder'=>Yii::t('easyii', 'Password')]) ?>
                        <?=Html::submitButton(Yii::t('easyii', 'Login'), ['class'=>'btn btn-lg btn-primary btn-block']) ?>
                    <?php ActiveForm::end(); ?>
                </div>
            </div>
        </div>
    </div>
</div>
