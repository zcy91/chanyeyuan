<?php
namespace console\behaviors\service;

use console\behaviors\BaseBehavior;

class ServiceBehavior extends BaseBehavior {

    public function getModels_ServiceAdd() {
        return array(
            'console\models\service\InitData_BaseService' => 'serviceAdd',
            'console\models\service\BaseService' => 'add',
        );
    }

    public function getModels_ServiceBannerAdd() {
        return array(
            'console\models\service\InitData_BaseService' => 'serviceBannerAdd',
            'console\models\service\BaseServiceBanner' => 'add',
        );
    }
    
    public function getModels_ServiceEdit() {
        return array(
            'console\models\service\InitData_BaseService' => 'serviceEdit',
            'console\models\service\BaseService' => 'modify',
        );
    }

    public function getModels_ServiceBannerEdit() {
        return array(
            'console\models\service\InitData_BaseService' => 'serviceBannerEdit',
            'console\models\service\BaseServiceBanner' => 'modify',
        );
    }

    public function getModels_ServiceDisplay() {
        return array(
            'console\models\base\InitData_BaseProduct' => 'serviceDisplay',
            'console\models\base\BaseProduct' => 'modify',
            'console\models\base\BaseProductOperate' => 'add',            
        );
    }    

    public function getModels_ServiceDelete() {
        return array(
            'console\models\service\InitData_BaseService' => 'serviceDelete',
            'console\models\service\BaseService' => 'delete',
//
        );
    }

    public function getModels_ServiceBannerDelete() {
        return array(
            'console\models\service\InitData_BaseService' => 'serviceBannerDelete',
            'console\models\service\BaseService' => 'bannerdelete',
//
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
            'console\models\service\List_BaseService' => "servicelist"
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
