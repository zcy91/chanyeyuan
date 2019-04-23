<?php
namespace console\behaviors\businessService;

use console\behaviors\BaseBehavior;

class BusinessServiceBehavior extends BaseBehavior {

    public function getModels_ServiceAdd() {
        return array(
            'console\models\businessService\InitData_BaseBusiness' => 'add',
            'console\models\businessService\BaseBusinessService' => 'add',
//            'console\models\base\BaseProductAttr' => 'add',
//            'console\models\base\BaseProductAttrItem' => 'add',
//            'console\models\base\BaseProductOperate' => 'add',
        );
    }

    public function getModels_ServiceEdit() {
        return array(
            'console\models\businessService\InitData_BaseBusiness' => 'edit',
            'console\models\businessService\BaseBusinessService' => 'modify',
//            'console\models\base\BaseProductAttr' => 'deleteAdd',
//            'console\models\base\BaseProductAttrItem' => 'deleteAdd',
//            'console\models\base\BaseProductOperate' => 'add',
        );
    }

    public function getModels_ServiceDelete() {
        return array(
            'console\models\businessService\InitData_BaseBusiness' => 'delete',
            'console\models\businessService\BaseBusinessService' => 'delete',
//            'console\models\base\BaseProductAttr' => 'delete',
//            'console\models\base\BaseProductAttrItem' => 'delete',
//            'console\models\base\BaseProductCommissionQuot' => 'delete',
//            'console\models\base\BaseProductCommissionPercentage' => 'delete',
//            'console\models\base\BaseProductOperate' => 'add',
        );
    }

    public function getModels_ServiceList() {
        return array(
            'console\models\businessService\List_BaseBusinessService' => "business_service_list"
        );
    }

    public function getModels_ServiceDesc() {
        return array(
            'console\models\service\List_BaseService' => "serviceDesc"
        );
    }


}
