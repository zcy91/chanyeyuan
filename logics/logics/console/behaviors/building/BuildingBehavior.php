<?php
namespace console\behaviors\building;

use console\behaviors\BaseBehavior;

class BuildingBehavior extends BaseBehavior {

    public function getModels_ServiceAdd() {
        return array(
            'console\models\Building\InitData_BaseBuilding' => 'buildingAdd',
            'console\models\Building\BaseBuilding' => 'add',
        );
    }

    public function getModels_ServiceEdit() {
        return array(
            'console\models\Building\InitData_BaseBuilding' => 'buildingedit',
            'console\models\Building\BaseBuilding' => 'modify',

        );
    }

    public function getModels_ServiceDelete() {
        return array(
            'console\models\Building\InitData_BaseBuilding' => 'buildingdelete',
            'console\models\Building\BaseBuilding' => 'delete',
        );
    }

    public function getModels_ServiceList() {
        return array(
            'console\models\Building\List_BaseBuilding' => "buildingList"
        );
    }

    public function getModels_ServiceDesc() {
        return array(
            'console\models\service\List_BaseService' => "serviceDesc"
        );
    }


}
