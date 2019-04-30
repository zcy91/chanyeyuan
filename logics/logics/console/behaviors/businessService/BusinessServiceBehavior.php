<?php
namespace console\behaviors\businessService;

use console\behaviors\BaseBehavior;

class BusinessServiceBehavior extends BaseBehavior {

    public function getModels_ServiceAdd() {
        return array(
            'console\models\businessService\InitData_BaseBusiness' => 'add',
            'console\models\businessService\BaseBusinessService' => 'add',
        );
    }

    public function getModels_ServiceBannerAdd() {
        return array(
            'console\models\businessService\InitData_BaseBusiness' => 'banneradd',
            'console\models\businessService\BaseBusinessServiceBanner' => 'add',
        );
    }

    public function getModels_ServiceEdit() {
        return array(
            'console\models\businessService\InitData_BaseBusiness' => 'edit',
            'console\models\businessService\BaseBusinessService' => 'modify',
        );
    }
    public function getModels_ServiceBannerEdit() {
        return array(
            'console\models\businessService\InitData_BaseBusiness' => 'banneredit',
            'console\models\businessService\BaseBusinessServiceBanner' => 'modify',
        );
    }


    public function getModels_ServiceDelete() {
        return array(
            'console\models\businessService\InitData_BaseBusiness' => 'delete',
            'console\models\businessService\BaseBusinessService' => 'delete',
        );
    }
    public function getModels_ServiceBannerDelete() {
        return array(
            'console\models\businessService\InitData_BaseBusiness' => 'bannerdelete',
            'console\models\businessService\BaseBusinessServiceBanner' => 'delete',
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
