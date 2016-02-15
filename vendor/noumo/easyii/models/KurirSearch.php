<?php

namespace yii\easyii\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use yii\easyii\models\Kurir;

class KurirSearch extends Kurir
{
    public function rules()
    {
        return [
            [['kurir_id'], 'integer'],
            [['name', 'address', 'phone'], 'safe'],
        ];
    }

    public function scenarios()
    {
        return Model::scenarios();
    }

    public function search($params)
    {
        $query = Kurir::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'kurir_id' => $this->kurir_id,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'phone', $this->phone]);

        return $dataProvider;
    }
}
