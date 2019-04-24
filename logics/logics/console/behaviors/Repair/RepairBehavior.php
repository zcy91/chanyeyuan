<?php
namespace console\behaviors\repair;

use console\behaviors\BaseBehavior;

class RepairBehavior extends BaseBehavior {

    public function getModels_ServiceAdd() {
        return array(
            'console\models\repair\InitData_BaseRepair' => 'repairAdd',
            'console\models\repair\BaseRepair' => 'add',
//            'console\models\base\BaseProductAttr' => 'add',
//            'console\models\base\BaseProductAttrItem' => 'add',
//            'console\models\base\BaseProductOperate' => 'add',
        );
    }

    public function getModels_ServiceEdit() {
        return array(
            'console\models\repair\InitData_BaseRepair' => 'repairEdit',
            'console\models\repair\BaseRepair' => 'modify',
//            'console\models\base\BaseProductAttr' => 'deleteAdd',
//            'console\models\base\BaseProductAttrItem' => 'deleteAdd',
//            'console\models\base\BaseProductOperate' => 'add',
        );
    }

    public function getModels_ServiceDisplay() {
        return array(
            'console\models\base\InitData_BaseProduct' => 'repairDisplay',
            'console\models\base\BaseProduct' => 'modify',
            'console\models\base\BaseProductOperate' => 'add',
        );
    }

    public function getModels_ServiceDelete() {
        return array(
            'console\models\repair\InitData_BaseRepair' => 'repairDelete',
            'console\models\repair\BaseRepair' => 'delete',
//            'console\models\base\BaseProductAttr' => 'delete',
//            'console\models\base\BaseProductAttrItem' => 'delete',
//            'console\models\base\BaseProductCommissionQuot' => 'delete',
//            'console\models\base\BaseProductCommissionPercentage' => 'delete',
//            'console\models\base\BaseProductOperate' => 'add',
        );
    }

    public function getModels_ServiceCommission() {
        return array(
            'console\models\base\InitData_BaseProduct' => 'productCommission',
            'console\models\base\BaseProduct' => 'modify',
            'console\models\base\BaseProductCommissionQuot' => 'handle',
            'console\models\base\BaseProductCommissionPercentage' => 'handle',
            'console\models\base\BaseProductOperate' => 'add',
        );
    }

    public function getModels_ServiceList() {
        return array(
            'console\models\repair\List_BaseRepair' => "repairlist"
        );
    }

    public function getModels_ServiceDesc() {
        return array(
            'console\models\repair\List_BaseService' => "repairDesc"
        );
    }

    public function getModels_ServiceCommissionDesc() {
        return array(
            'console\models\base\List_BaseProduct' => "productCommissionDesc"
        );
    }

}
