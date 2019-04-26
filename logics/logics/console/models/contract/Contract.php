<?php
namespace console\models\contract;

use yii\db\ActiveRecord;

class Contract extends ActiveRecord{
    public static function tableName()
    {
        return 'contract';

    }