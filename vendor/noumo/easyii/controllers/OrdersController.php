<?php

namespace yii\easyii\controllers;

use Yii;
use yii\easyii\models\Orders;
use yii\easyii\models\OrdersSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

class OrdersController extends \yii\easyii\components\Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    public function actionIndex()
    {
        $searchModel = new OrdersSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
		Yii::$app->user->setReturnUrl(['/admin/orders']);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    public function actionCreate()
    {
        $model = new Orders();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->order_id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->order_id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    protected function findModel($id)
    {
        if (($model = Orders::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

	public function actionExport1(){
	$query = new \yii\db\Query();
	$query	->select(['shopcart_orders.order_id as order_id', 'shopcart_orders.name as name', 'shopcart_orders.address as address', 'shopcart_orders.phone as phone', 'shopcart_orders.email as email', 'shopcart_orders.date as date', 'shopcart_orders.ip as ip', 'shopcart_goods.count as count', 'shopcart_goods.price as price', 'shopcart_goods.item_id as item_id', 'catalog_items.title as title'])
			->from('shopcart_orders')
			->join('inner join', 'shopcart_goods',
					'shopcart_orders.order_id=shopcart_goods.order_id'
				)
			->join('inner join', 'catalog_items',
					'shopcart_goods.item_id=catalog_items.item_id'
				);
	$command = $query->createCommand();
	$model = $command->queryAll();
	$no = 1;
		$filename = 'Export-Order-'.Date('YmdGis').'.xls';
		header("Content-type: application/vnd-ms-excel");
		header("Content-Disposition: attachment; filename=".$filename);
		echo '<h1>Data Seluruh Order Detolixir Surabaya</h1>
			<table border="1" width="100%">
			<thead>
				<tr>
					<th>No.</th>
					<th>ID Order</th>
					<th>Nama Pembeli</th>
					<th>Alamat</th>
					<th>Telepon</th>
					<th>Email</th>
					<th>Tanggal Kirim</th>
					<th>ID Item</th>
					<th>Nama Item</th>
					<th>Jumlah</th>
					<th>Harga</th>
					<th>Total Bayar</th>
				</tr>
			</thead>';
			foreach($model as $data){
				$total = $data['count'] * $data['price'];
				echo '
					<tr>
						<td>'.$no++.'</td>
						<td>'.$data['order_id'].'</td>
						<td>'.$data['name'].'</td>
						<td>'.$data['address'].'</td>
						<td>'.$data['phone'].'</td>
						<td>'.$data['email'].'</td>
						<td>'.$data['date'].'</td>
						<td>'.$data['item_id'].'</td>
						<td>'.$data['title'].'</td>
						<td>'.$data['count'].'</td>
						<td>Rp. '.$data['price'].'</td>
						<td>Rp. '.$total.'</td>
					</tr>
				';
			}
		echo '</table>';
	}
	public function actionExport2(){
	$time = new \DateTime('now');
	$today = $time->format('M d, Y');
	$query2 = new \yii\db\Query();
	$query2	->select(['catalog_items.item_id as item_id', 'catalog_items.title as title', 'catalog_categories.title as cat', 'shopcart_goods.count as count'])
			->from('catalog_items')
			->join('inner join', 'shopcart_goods',
					'catalog_items.item_id=shopcart_goods.item_id'
				)
			->join('inner join', 'catalog_categories',
					'catalog_items.category_id=catalog_categories.category_id'
				)
			->join('inner join', 'shopcart_orders',
					'shopcart_goods.order_id=shopcart_orders.order_id'
				)
			->where(['=', 'shopcart_orders.date', $today]);
	$command2 = $query2->createCommand();
	$model2 = $command2->queryAll();
	$no = 1;
		$filename = 'Export-Order-'.Date('YmdGis').'.xls';
		header("Content-type: application/vnd-ms-excel");
		header("Content-Disposition: attachment; filename=".$filename);
		echo '<h1>Data Produksi Detolixir Surabaya Tanggal '.$today.'</h1>
			<table border="1" width="100%">
			<thead>
				<tr>
					<th>No.</th>
					<th>ID Item</th>
					<th>Nama Item</th>
					<th>Kategori Item</th>
					<th>Jumlah</th>
				</tr>
			</thead>';
			foreach($model2 as $data){
				echo '
					<tr>
						<td>'.$no++.'</td>
						<td>'.$data['item_id'].'</td>
						<td>'.$data['title'].'</td>
						<td>'.$data['cat'].'</td>
						<td>'.$data['count'].'</td>
					</tr>
				';
			}
		echo '</table>';
	}
}
