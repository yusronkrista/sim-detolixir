<?php

namespace yii\easyii\models;

use Yii;

class Orders extends \yii\db\ActiveRecord
{
    public static function tableName()
    {
        return 'shopcart_orders';
    }

    public function rules()
    {
        return [
            [['time', 'new', 'status'], 'integer'],
            [['kurir', 'email', 'date'], 'string', 'max' => 128],
            [['payment', 'name', 'phone'], 'string', 'max' => 64],
            [['address'], 'string', 'max' => 255],
            [['comment', 'remark'], 'string', 'max' => 1024],
            [['access_token'], 'string', 'max' => 32],
            [['ip'], 'string', 'max' => 16],
        ];
    }

    public function attributeLabels()
    {
        return [
            'order_id' => 'Order ID',
            'kurir' => 'Kurir',
            'payment' => 'Payment',
            'name' => 'Name',
            'address' => 'Address',
            'phone' => 'Phone',
            'email' => 'Email',
            'comment' => 'Comment',
            'remark' => 'Remark',
            'date' => 'Date',
            'access_token' => 'Access Token',
            'ip' => 'Ip',
            'time' => 'Time',
            'new' => 'New',
            'status' => 'Status',
        ];
    }
}
