<?php
namespace console\behaviors\system;

use console\behaviors\BaseBehavior;

class SysBehavior extends BaseBehavior {

    public function getModels_SysLogAdd() {
        return array(
            'console\models\system\InitData_Sys' => 'logAdd',
            'console\models\system\AccessLog' => 'logAdd'
        );
    }
    
    public function getModels_SysErrAdd() {
        return array(
            'console\models\system\InitData_Sys' => 'errAdd',
            'console\models\system\ErrorLog' => 'errAdd'
        );
    }    

    public function getModels_SysModuleInfo() {
        return array(
            'console\models\system\View_Module' => "fetchModuleOne",
        );
    }

    public function getModels_SysErrorInfo() {
        return array(
            'console\models\system\View_Error' => "fetchErrorOne"
        );
    }
    
    public function getModels_FetchSysInfo() {
        return array(
            'console\models\system\List_Sys' => "fetchSysInfo"
        );
    }

    public function getModels_SysBannerAdd() {
        return array(
            'console\models\system\InitData_Sys' => 'bannerAdd',
            'console\models\system\BaseBanner' => 'Add'
        );
    }
    public function getModels_SysBannerEdit() {
        return array(
            'console\models\system\InitData_Sys' => 'bannerEdit',
            'console\models\system\BaseBanner' => 'modify'
        );
    }

}
