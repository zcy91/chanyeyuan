<?php
namespace console\models\building;

use yii\db\ActiveRecord;

class Building extends ActiveRecord
{
    public static function tableName()
    {
        return 'building';

    }
}