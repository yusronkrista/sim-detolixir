<?php
use yii\easyii\modules\shopcart\models\Order;
use yii\easyii\models\Kurir;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;

$this->title = Yii::t('easyii/shopcart', 'Order') . ' #' . $order->primaryKey;
$this->registerCss('.shopcart-view dt{margin-bottom: 10px;}');

$states = Order::states();
unset($states[Order::STATUS_BLANK]);

$module = $this->context->module->id;

$payments = ['Belum dibayar' => 'Belum dibayar', 'Tidak dibayar' => 'Tidak dibayar', 'Sudah dibayar' => 'Sudah dibayar', 'Lain-lain' => 'Lain-lain'];
?>
<?= $this->render('_menu') ?>
<?= Html::beginForm() ?>
<dl class="dl-horizontal shopcart-view">
    <dt><?= Yii::t('easyii', 'Nama') ?></dt>
    <dd><?= $order->name ?></dd>
    <dt><?= Yii::t('easyii/shopcart', 'Alamat') ?></dt>
    <dd><?= $order->address ?></dd>
    <?php if($this->context->module->settings['enablePhone']) : ?>
        <dt><?= Yii::t('easyii/shopcart', 'Telepon') ?></dt>
        <dd><?= $order->phone ?></dd>
    <?php endif; ?>
    <?php if($this->context->module->settings['enableEmail']) : ?>
        <dt><?= Yii::t('easyii', 'E-mail') ?></dt>
        <dd><?= $order->email ?></dd>
    <?php endif; ?>
    <dt><?= Yii::t('easyii', 'Tanggal Order') ?></dt>
    <dd><?= Yii::$app->formatter->asDatetime($order->time, 'medium') ?></dd>
    <dt><?= Yii::t('easyii', 'Tanggal Kirim') ?></dt>
    <dd style="color:red;"><?= $order->date ?></dd>
    <dt>IP</dt>
    <dd><?= $order->ip ?> <a href="//freegeoip.net/?q=<?= $order->ip ?>" class="label label-info" target="_blank">info</a></dd>
    <dt><?= Yii::t('easyii/shopcart', 'Komentar') ?></dt>
    <dd><?= nl2br($order->comment) ?></dd>
        <dt><?= Yii::t('easyii', 'Pembayaran') ?></dt>
        <dd>
            <div class="form-group">
                <?= Html::DropDownList('payment', $order->payment, $payments) ?>
            </div>
        </dd>
    <?php if($order->status != Order::STATUS_BLANK) : ?>
        <dt><?= Yii::t('easyii', 'Status') ?></dt>
        <dd>
            <div class="form-group">
                <?= Html::dropDownList('status', $order->status, $states) ?>
            </div>
        </dd>
    <?php endif; ?>
        <dt><?= Yii::t('easyii', 'Kurir') ?></dt>
        <dd>
            <div class="form-group">
                <?= Html::DropDownList('kurir', $order->kurir, ArrayHelper::map(Kurir::find()->all(), 'name', 'name'), ['prompt' => 'Pilih kurir']) ?>
            </div>
        </dd>
    <dt><?= Yii::t('easyii/shopcart', 'Catatan') ?></dt>
    <dd>
        <div class="form-group" style="width:500">
            <?= Html::textarea('remark', $order->remark, ['class' => 'form-control', 'rows' => '4']) ?>
        </div>
    </dd>
    <dd><?= Html::submitButton(Yii::t('easyii', 'Save'), ['class' => 'btn btn-primary']) ?></dd>
</dl>
<?= Html::endForm() ?>
<hr>
<h3><?= Yii::t('easyii/shopcart', 'Items') ?></h3>
<table class="table table-bordered">
    <thead>
        <th><?= Yii::t('easyii', 'Nama') ?></th>
        <th><?= Yii::t('easyii/shopcart', 'Options') ?></th>
        <th width="80"><?= Yii::t('easyii/shopcart', 'Jumlah') ?></th>
        <th width="80"><?= Yii::t('easyii/shopcart', 'Diskon') ?></th>
        <th width="150"><?= Yii::t('easyii/shopcart', 'Harga') ?></th>
        <th width="30"></th>
    </thead>
    <tbody>
        <?php foreach($goods as $good) : ?>
            <tr>
                <td><?= Html::a($good->item->title, ['/admin/catalog/items/edit', 'id' => $good->item->primaryKey]) ?></td>
                <td><?= $good->options ?></td>
                <td><?= $good->count ?></td>
                <td><?= $good->discount ?></td>
                <td>
                    <?php if($good->discount) : ?>
                        <b><?= round($good->price * (1 - $good->discount / 100)) ?></b>
                        <strike><small class="smooth"><?= $good->price ?></small></strike>
                    <?php else : ?>
                        <b><?= $good->price ?></b>
                    <?php endif; ?>
                </td>
                <td><a href="<?= Url::to(['/admin/'.$module.'/goods/delete', 'id' => $good->primaryKey]) ?>" class="glyphicon glyphicon-remove confirm-delete" title="<?= Yii::t('easyii', 'Delete item') ?>"></a></td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>
<h2 class="text-right"><small><?= Yii::t('easyii/shopcart', 'Total bayar Rp.') ?></small> <?= $order->cost ?></h2>

