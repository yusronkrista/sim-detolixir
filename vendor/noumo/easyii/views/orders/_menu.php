<?php
use yii\helpers\Url;

$action = $this->context->action->id;
$module = $this->context->module->id;

$backTo = null;
$indexUrl = Url::to(['/admin/shopcart']);
$processedUrl = Url::to(['/admin/shopcart/a/processed']);
$sentUrl = Url::to(['/admin/shopcart/a/sent']);
$completedUrl = Url::to(['/admin/shopcart/a/completed']);
$failsUrl = Url::to(['/admin/shopcart/a/fails']);
$blankUrl = Url::to(['/admin/shopcart/a/blank']);
$allUrl = Url::to(['/admin/orders']);

if($action === 'view')
{
    $returnUrl = $this->context->getReturnUrl($indexUrl);

    if(strpos($returnUrl, 'processed') !== false){
        $backTo = 'processed';
        $processedUrl = $returnUrl;
    } elseif(strpos($returnUrl, 'sent') !== false) {
        $backTo = 'sent';
        $sentUrl = $returnUrl;
    } elseif(strpos($returnUrl, 'completed') !== false) {
        $backTo = 'completed';
        $completedUrl = $returnUrl;
    } elseif(strpos($returnUrl, 'fails') !== false) {
        $backTo = 'fails';
        $failsUrl = $returnUrl;
    } elseif(strpos($returnUrl, 'blank') !== false) {
        $backTo = 'blank';
        $blankUrl = $returnUrl;
    } elseif(strpos($returnUrl, 'all') !== false) {
        $backTo = 'all';
        $allUrl = $returnUrl;
    } else {
        $backTo = 'index';
        $indexUrl = $returnUrl;
    }
}
?>
<ul class="nav nav-pills">
    <li>
        <a href="<?= $indexUrl ?>">
            <?php if($backTo === 'index') : ?>
                <i class="glyphicon glyphicon-chevron-left font-12"></i>
            <?php endif; ?>
            Menunggu
        </a>
    </li>
    <li>
        <a href="<?= $processedUrl ?>">
            <?php if($backTo === 'processed') : ?>
                <i class="glyphicon glyphicon-chevron-left font-12"></i>
            <?php endif; ?>
            Proses
        </a>
    </li>
    <li>
        <a href="<?= $sentUrl ?>">
            <?php if($backTo === 'sent') : ?>
                <i class="glyphicon glyphicon-chevron-left font-12"></i>
            <?php endif; ?>
            Dikirim
        </a>
    </li>
    <li>
        <a href="<?= $completedUrl ?>">
            <?php if($backTo === 'completed') : ?>
                <i class="glyphicon glyphicon-chevron-left font-12"></i>
            <?php endif; ?>
            Diterima
        </a>
    </li>
    <li <?= ($action === 'fails') ? 'class="active"' : '' ?>>
        <a href="<?= $failsUrl ?>">
            <?php if($backTo === 'fails') : ?>
                <i class="glyphicon glyphicon-chevron-left font-12"></i>
            <?php endif; ?>
            Batal
        </a>
    </li>
    <li>
        <a href="<?= $blankUrl ?>">
            <?php if($backTo === 'blank') : ?>
                <i class="glyphicon glyphicon-chevron-left font-12"></i>
            <?php endif; ?>
            Kosong
        </a>
    </li>
    <li class="active">
        <a href="<?= $allUrl ?>">
            <?php if($backTo === 'all') : ?>
                <i class="glyphicon glyphicon-chevron-left font-12"></i>
            <?php endif; ?>
            Semua
        </a>
    </li>
</ul>
<br/>