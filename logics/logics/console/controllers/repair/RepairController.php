<?php
namespace console\controllers\repair;

use console\behaviors\repair\RepairBehavior;
use console\events\repair\RepairEvent;
use console\controllers\BaseController;
use console\behaviors\BaseBehavior;

class RepairController extends BaseController {

    public function init() {
        parent::init();
        $this->behavior = new RepairBehavior();
        $this->attachBehavior("Repairbehavior", $this->behavior);
        $this->event = new RepairEvent();
    }

    public function actionRepairadd($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::add($this->getModels_ServiceAdd(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionRepairedit($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::modify($this->getModels_ServiceEdit(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionRepairdisplay($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::modify($this->getModels_ServiceDisplay(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionRepairdelete($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::delete($this->getModels_ServiceDelete(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionServicecommission($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::modify($this->getModels_ServiceCommission(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionRepairlist($data) {

        $this->event->set($data, BaseBehavior::FETCH_ALL_ACTION);
        parent::fetch_all($this->getModels_ServiceList(), $this->event, false);
        $this->event->Display();
        return 0;
    }

    public function actionRepairdesc($data) {
        $this->event->set($data, BaseBehavior::FETCH_ALL_ACTION);
        parent::fetch_all($this->getModels_ServiceDesc(), $this->event, false);
        $this->event->Display();
        return 0;
    }

    public function actionServicecommissiondesc($data) {
        $this->event->set($data, BaseBehavior::FETCH_ALL_ACTION);
        parent::fetch_all($this->getModels_ServiceCommissionDesc(), $this->event, false);
        $this->event->Display();
        return 0;
    }

}
