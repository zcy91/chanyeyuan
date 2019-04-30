<?php
namespace console\behaviors\customer;

use console\behaviors\BaseBehavior;

class CustomerBehavior extends BaseBehavior {

    public function getModels_ServiceAdd() {
        return array(
            'console\models\Customer\InitData_BaseCustomer' => 'customerAdd',
            'console\models\Customer\BaseCustomer' => 'add',
        );
    }

    public function getModels_ServiceEdit() {
        return array(
            'console\models\Customer\InitData_BaseCustomer' => 'customerEdit',
            'console\models\Customer\BaseCustomer' => 'modify',

        );
    }

    public function getModels_ServiceDelete() {
        return array(
            'console\models\Customer\InitData_BaseCustomer' => 'customerdelete',
            'console\models\Customer\BaseCustomer' => 'delete',
        );
    }

    public function getModels_ServiceList() {
        return array(
            'console\models\Customer\List_BaseCustomer' => "customerList"
        );
    }


}
