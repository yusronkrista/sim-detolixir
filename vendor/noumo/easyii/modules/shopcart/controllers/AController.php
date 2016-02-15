<?php
namespace yii\easyii\modules\shopcart\controllers;

use Yii;
use yii\data\ActiveDataProvider;

use yii\easyii\components\Controller;
use yii\easyii\modules\shopcart\models\Good;
use yii\easyii\modules\shopcart\models\Order;

class AController extends Controller
{
    public $pending = 0;
    public $processed = 0;
    public $sent = 0;

    public function init()
    {
        parent::init();

        $this->pending = Order::find()->status(Order::STATUS_PENDING)->count();
        $this->processed = Order::find()->status(Order::STATUS_PROCESSED)->count();
        $this->sent = Order::find()->status(Order::STATUS_SENT)->count();
    }

    public function actionIndex()
    {
        return $this->render('index', [
            'data' => new ActiveDataProvider([
                'query' => Order::find()->with('goods')->status(Order::STATUS_PENDING)->asc(),
                'totalCount' => $this->pending
            ])
        ]);
    }

    public function actionProcessed()
    {
        $this->setReturnUrl();
        return $this->render('index', [
            'data' => new ActiveDataProvider([
                'query' => Order::find()->with('goods')->status(Order::STATUS_PROCESSED)->asc(),
                'totalCount' => $this->processed
            ])
        ]);
    }

    public function actionSent()
    {
        $this->setReturnUrl();
        return $this->render('index', [
            'data' => new ActiveDataProvider([
                'query' => Order::find()->with('goods')->status(Order::STATUS_SENT)->asc(),
                'totalCount' => $this->sent
            ])
        ]);
    }

    public function actionCompleted()
    {
        $this->setReturnUrl();
        return $this->render('index', [
            'data' => new ActiveDataProvider([
                'query' => Order::find()->with('goods')->status(Order::STATUS_COMPLETED)->desc()
            ])
        ]);
    }

    public function actionFails()
    {
        $this->setReturnUrl();
        return $this->render('index', [
            'data' => new ActiveDataProvider([
                'query' => Order::find()->with('goods')->where(['in', 'status', [Order::STATUS_DECLINED, Order::STATUS_ERROR, Order::STATUS_RETURNED]])->desc()
            ])
        ]);
    }

    public function actionBlank()
    {
        $this->setReturnUrl();
        return $this->render('index', [
            'data' => new ActiveDataProvider([
                'query' => Order::find()->with('goods')->status(Order::STATUS_BLANK)->desc()
            ])
        ]);
    }

    public function actionView($id)
    {
        $request = Yii::$app->request;
        $order = Order::findOne($id);

        if($order === null){
            $this->flash('error', Yii::t('easyii', 'Not found'));
            return $this->redirect(['/admin/'.$this->module->id]);
        }


        if($request->post('status')){
            $newStatus = $request->post('status');
            $oldStatus = $order->status;

            $order->status = $newStatus;
            $order->remark = filter_var($request->post('remark'), FILTER_SANITIZE_STRING);
            $order->kurir = filter_var($request->post('kurir'), FILTER_SANITIZE_STRING);
            $order->payment = filter_var($request->post('payment'), FILTER_SANITIZE_STRING);

            if($order->save()){
                if($newStatus != $oldStatus && $request->post('notify')){
                    $order->notifyUser();
                }
                $this->flash('success', Yii::t('easyii/shopcart', 'Order updated'));
            }
            else {
                $this->flash('error', Yii::t('easyii', 'Update error. {0}', $order->formatErrors()));
            }
            return $this->refresh();
        }
        else {
            if ($order->new > 0) {
                $order->new = 0;
                $order->update();
            }

            $goods = Good::find()->where(['order_id' => $order->primaryKey])->with('item')->asc()->all();

            return $this->render('view', [
                'order' => $order,
                'goods' => $goods
            ]);
        }
    }

    public function actionDelete($id)
    {
        if(($model = Order::findOne($id))){
            $model->delete();
        } else {
            $this->error = Yii::t('easyii', 'Not found');
        }
        return $this->formatResponse(Yii::t('easyii/shopcart', 'Order deleted'));
    }
}