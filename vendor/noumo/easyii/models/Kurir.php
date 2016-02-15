<?php

namespace yii\easyii\models;

use Yii;

class Kurir extends \yii\db\ActiveRecord
{
    public static function tableName()
    {
        return 'kurir';
    }

    public function rules()
    {
        return [
            [['name', 'address', 'phone'], 'required'],
            [['name', 'phone'], 'string', 'max' => 64],
            [['address'], 'string', 'max' => 255],
        ];
    }

    public function attributeLabels()
    {
        return [
            'kurir_id' => 'ID',
            'name' => 'Nama lengkap',
            'address' => 'Alamat',
            'phone' => 'Telepon',
        ];
    }
}
