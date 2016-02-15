<?php
namespace app\assets;

class AppAsset extends \yii\web\AssetBundle
{
    public $sourcePath = '@app/media';
    public $css = [
        'stylesheets/8ddb01bd.main.css',
        'stylesheets/141830a9.bootstrap.css',
    ];
    public $js = [
        'js/main.js'
    ];
    public $depends = [
        'yii\web\JqueryAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
