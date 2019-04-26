<?php
namespace console\behaviors\contract;

use console\behaviors\BaseBehavior;

class ContractBehavior extends BaseBehavior {

    public function getModels_ServiceAdd() {
        return array(
            'console\models\Contract\InitData_BaseContract' => 'contractAdd',
            'console\models\Contract\BaseContract' => 'add',
        );
    }

    public function getModels_ServiceEdit() {
        return array(
            'console\models\Contract\InitData_BaseContract' => 'contractEdit',
            'console\models\Contract\BaseContract' => 'modify',

        );
    }

    public function getModels_ServiceDelete() {
        return array(
            'console\models\Contract\InitData_BaseContract' => 'contractdelete',
            'console\models\Contract\BaseContract' => 'delete',
        );
    }

    public function getModels_ServiceList() {
        return array(
            'console\models\Contract\List_BaseContract' => "contractList"
        );
    }


}
