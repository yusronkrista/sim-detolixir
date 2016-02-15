<?php
use yii\easyii\modules\feedback\api\Feedback;
use yii\easyii\modules\page\api\Page;

$page = Page::get('contact-text');

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
            <li class="active">Contact</li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
</div>
<div class="container  push-down-30">
  <div class="row">
    <div class="col-xs-12">
      <h1 class="center"><span class="light">Contact</span> Us</h1>
      <hr class="divider">
      <div class="text-shrink">
        <p class="text-highlight">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vulputate, leo vel malesuada tincidunt, purus nunc tristique erat, at elementum tellus mi nec mi. Nunc rutrum ullamcorper blandit.</p>
      </div>
      <hr class="divider  divider-about">
      <div class="push-down-30"></div>
      <div class="row">
        <div class="col-xs-12  col-sm-3">
        <h2><?= $page->title ?></h2>
        <?= $page->text ?>
        </div>
		<?php if(Yii::$app->request->get(Feedback::SENT_VAR)) : ?>
            <h4 class="text-success"><i class="glyphicon glyphicon-ok"></i> Message successfully sent</h4>
        <?php else : ?>
			<?= Feedback::form() ?>
		<?php endif; ?>
      </div>
    </div>
  </div>
</div>
