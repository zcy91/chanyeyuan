<?php
namespace console\behaviors\businessServiceCategory;

use console\behaviors\BaseBehavior;

class BusinessServiceCategoryBehavior extends BaseBehavior {

    public function getModels_ServiceAdd() {
        return array(
            'console\models\businessServiceCategory\InitData_BaseBusinessCategory' => 'add',
            'console\models\businessServiceCategory\BaseBusinessServiceCategory' => 'add',
        );
    }

    public function getModels_ServiceBannerAdd() {
        return array(
            'console\models\businessServiceCategory\InitData_BaseBusinessCategory' => 'banneradd',
            'console\models\businessServiceCategory\BaseBusinessServiceCategory' => 'add',
        );
    }

    public function getModels_ServiceEdit() {
        return array(
            'console\models\businessServiceCategory\InitData_BaseBusinessCategory' => 'edit',
            'console\models\businessServiceCategory\BaseBusinessServiceCategory' => 'modify',
//
        );
    }

    public function getModels_ServiceDelete() {
        return array(
            'console\models\businessServiceCategory\InitData_BaseBusinessCategory' => 'delete',
            'console\models\businessServiceCategory\BaseBusinessServiceCategory' => 'delete',
//
        );
    }
    public function getModels_ServiceBannerDelete() {
        return array(
            'console\models\businessServiceCategory\InitData_BaseBusinessCategory' => 'bannerdelete',
            'console\models\businessServiceCategory\BaseBusinessServiceCategoryBanner' => 'delete',
//
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


}
