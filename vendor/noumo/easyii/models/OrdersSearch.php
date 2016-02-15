<?php

namespace yii\easyii\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use yii\easyii\models\Orders;

class OrdersSearch extends Orders
{
    public function rules()
    {
        return [
            [['order_id', 'time', 'new', 'status'], 'integer'],
            [['kurir', 'payment', 'name', 'address', 'phone', 'email', 'comment', 'remark', 'date', 'access_token', 'ip'], 'safe'],
        ];
    }

    public function scenarios()
    {
        return Model::scenarios();
    }

    public function search($params)
    {
        $query = Orders::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'order_id' => $this->order_id,
            'time' => $this->time,
            'new' => $this->new,
            'status' => $this->status,
        ]);

        $query->andFilterWhere(['like', 'kurir', $this->kurir])
            ->andFilterWhere(['like', 'payment', $this->payment])
            ->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'phone', $this->phone])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'comment', $this->comment])
            ->andFilterWhere(['like', 'remark', $this->remark])
            ->andFilterWhere(['like', 'date', $this->date])
            ->andFilterWhere(['like', 'access_token', $this->access_token])
            ->andFilterWhere(['like', 'ip', $this->ip]);

        return $dataProvider;
    }
}
