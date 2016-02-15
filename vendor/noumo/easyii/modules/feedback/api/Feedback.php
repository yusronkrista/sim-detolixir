<?php
namespace yii\easyii\modules\feedback\api;

use Yii;
use yii\easyii\modules\feedback\models\Feedback as FeedbackModel;

use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
use yii\easyii\widgets\ReCaptcha;


/**
 * Feedback module API
 * @package yii\easyii\modules\feedback\api
 *
 * @method static string form(array $options = []) Returns fully worked standalone html form.
 * @method static array save(array $attributes) If you using your own form, this function will be useful for manual saving feedback's.
 */

class Feedback extends \yii\easyii\components\API
{
    const SENT_VAR = 'feedback_sent';

    private $_defaultFormOptions = [
        'errorUrl' => '',
        'successUrl' => ''
    ];

    public function api_form($options = [])
    {
        $model = new FeedbackModel;
        $settings = Yii::$app->getModule('admin')->activeModules['feedback']->settings;
        $options = array_merge($this->_defaultFormOptions, $options);

        ob_start();
        $form = ActiveForm::begin([
            'enableClientValidation' => true,
            'action' => Url::to(['/admin/feedback/send'])
        ]);
		
		echo "<div class='col-xs-12  col-sm-3'>";
        echo Html::hiddenInput('errorUrl', $options['errorUrl'] ? $options['errorUrl'] : Url::current([self::SENT_VAR => 0]));
        echo Html::hiddenInput('successUrl', $options['successUrl'] ? $options['successUrl'] : Url::current([self::SENT_VAR => 1]));

		echo "<div class='form-group'>";
        echo $form->field($model, 'name')->textInput(['class' => 'form-control form-control--contact']);
		echo "</div>";

		echo "<div class='form-group'>";
        echo $form->field($model, 'email')->textInput(['class' => 'form-control form-control--contact']);
		echo "</div>";

		echo "<div class='form-group'>";
        if($settings['enablePhone']) echo $form->field($model, 'phone')->textInput(['class' => 'form-control form-control--contact']);
		echo "</div>";

        if($settings['enableTitle']) echo $form->field($model, 'title')->textInput(['class' => 'form-control form-control--contact']);

		echo "</div>";

		echo "<div class='col-xs-12  col-sm-6'>";
		echo "<div class='form-group'>";
        echo $form->field($model, 'text')->textarea(['class' => 'form-control form-control--contact form-control--big', 'rows' => '12']);
		echo "</div>";

        if($settings['enableCaptcha']) echo $form->field($model, 'reCaptcha')->widget(ReCaptcha::className());

		echo "<div class='right'>";
        echo Html::submitButton(Yii::t('easyii', 'Send'), ['class' => 'btn btn-primary']);
		echo "</div>";
		echo "</div>";

        ActiveForm::end();

        return ob_get_clean();
    }

    public function api_save($data)
    {
        $model = new FeedbackModel($data);
        if($model->save()){
            return ['result' => 'success'];
        } else {
            return ['result' => 'error', 'error' => $model->getErrors()];
        }
    }
}