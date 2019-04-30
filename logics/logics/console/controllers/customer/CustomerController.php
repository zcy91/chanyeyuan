<?php
namespace console\controllers\customer;

use console\behaviors\contract\ContractBehavior;
use console\behaviors\customer\CustomerBehavior;
use console\behaviors\housing\HousingBehavior;
use console\controllers\BaseController;
use console\behaviors\BaseBehavior;
use console\events\contract\ContractEvent;
use console\events\customer\CustomerEvent;
use console\events\housing\HousingEvent;

class CustomerController extends BaseController {

    public function init() {
        parent::init();
        $this->behavior = new CustomerBehavior();
        $this->attachBehavior("Customerbehavior", $this->behavior);
        $this->event = new CustomerEvent();
    }

    public function actionCustomeradd($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::add($this->getModels_ServiceAdd(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionCustomeredit($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::modify($this->getModels_ServiceEdit(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionCustomerdelete($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::delete($this->getModels_ServiceDelete(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionCustomerlist($data) {

        $this->event->set($data, BaseBehavior::FETCH_ALL_ACTION);
        parent::fetch_all($this->getModels_ServiceList(), $this->event, false);
        $this->event->Display();
        return 0;
    }


}
