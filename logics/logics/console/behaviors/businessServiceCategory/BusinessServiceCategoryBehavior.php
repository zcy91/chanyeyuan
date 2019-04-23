<?php
namespace console\behaviors\businessServiceCategory;

use console\behaviors\BaseBehavior;

class BusinessServiceCategoryBehavior extends BaseBehavior {

    public function getModels_ServiceAdd() {
        return array(
            'console\models\businessServiceCategory\InitData_BaseBusinessCategory' => 'add',
            'console\models\businessServiceCategory\BaseBusinessServiceCategory' => 'add',
//            'console\models\base\BaseProductAttr' => 'add',
//            'console\models\base\BaseProductAttrItem' => 'add',
//            'console\models\base\BaseProductOperate' => 'add',
        );
    }

    public function getModels_ServiceEdit() {
        return array(
            'console\models\businessServiceCategory\InitData_BaseBusinessCategory' => 'edit',
            'console\models\businessServiceCategory\BaseBusinessServiceCategory' => 'modify',
//            'console\models\base\BaseProductAttr' => 'deleteAdd',
//            'console\models\base\BaseProductAttrItem' => 'deleteAdd',
//            'console\models\base\BaseProductOperate' => 'add',
        );
    }

    public function getModels_ServiceDelete() {
        return array(
            'console\models\businessServiceCategory\InitData_BaseBusinessCategory' => 'delete',
            'console\models\businessServiceCategory\BaseBusinessServiceCategory' => 'delete',
//            'console\models\base\BaseProductAttr' => 'delete',
//            'console\models\base\BaseProductAttrItem' => 'delete',
//            'console\models\base\BaseProductCommissionQuot' => 'delete',
//            'console\models\base\BaseProductCommissionPercentage' => 'delete',
//            'console\models\base\BaseProductOperate' => 'add',
        );
    }

    public function getModels_ServiceList() {
        return array(
            'console\models\businessServiceCategory\List_BaseBusinessServiceCategory' => "categorylist"
        );
    }

    public function getModels_ServiceDesc() {
        return array(
            'console\models\service\List_BaseService' => "serviceDesc"
        );
    }

    public function getModels_ServiceCommissionDesc() {
        return array(
            'console\models\base\List_BaseProduct' => "productCommissionDesc"
        );
    }

}
