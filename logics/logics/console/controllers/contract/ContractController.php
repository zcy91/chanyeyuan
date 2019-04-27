<?php
namespace console\controllers\contract;

use console\behaviors\contract\ContractBehavior;
use console\behaviors\housing\HousingBehavior;
use console\controllers\BaseController;
use console\behaviors\BaseBehavior;
use console\events\contract\ContractEvent;
use console\events\housing\HousingEvent;

class ContractController extends BaseController {

    public function init() {
        parent::init();
        $this->behavior = new ContractBehavior();
        $this->attachBehavior("Contractbehavior", $this->behavior);
        $this->event = new ContractEvent();
    }

    public function actionContractadd($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);

        if(!empty($data['contract_id'])){
            parent::add($this->getModels_CostAdd(), $this->event);
        }else{
            parent::add($this->getModels_ServiceAdd(), $this->event);
        }

        $this->event->Display();
        return 0;
    }

    public function actionContractedit($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::modify($this->getModels_ServiceEdit(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionContractdelete($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::delete($this->getModels_ServiceDelete(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionContractlist($data) {

        $this->event->set($data, BaseBehavior::FETCH_ALL_ACTION);
        parent::fetch_all($this->getModels_ServiceList(), $this->event, false);
        $this->event->Display();
        return 0;
    }


}
