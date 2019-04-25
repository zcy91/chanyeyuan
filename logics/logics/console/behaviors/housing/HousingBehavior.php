<?php
namespace console\behaviors\housing;

use console\behaviors\BaseBehavior;

class HousingBehavior extends BaseBehavior {

    public function getModels_ServiceAdd() {
        return array(
            'console\models\Housing\InitData_BaseHousing' => 'housingAdd',
            'console\models\Housing\BaseHousing' => 'add',
        );
    }

    public function getModels_ServiceEdit() {
        return array(
            'console\models\Housing\InitData_BaseHousing' => 'housingEdit',
            'console\models\Housing\BaseHousing' => 'modify',

        );
    }

    public function getModels_ServiceDelete() {
        return array(
            'console\models\Housing\InitData_BaseHousing' => 'housingdelete',
            'console\models\Housing\BaseHousing' => 'delete',
        );
    }

    public function getModels_ServiceList() {
        return array(
            'console\models\Housing\List_BaseHousing' => "housingList"
        );
    }

    public function getModels_ServiceDesc() {
        return array(
            'console\models\service\List_BaseService' => "serviceDesc"
        );
    }


}
