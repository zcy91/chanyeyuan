<?php
namespace console\controllers\housing;

use console\behaviors\housing\HousingBehavior;
use console\controllers\BaseController;
use console\behaviors\BaseBehavior;
use console\events\housing\HousingEvent;

class HousingController extends BaseController {

    public function init() {
        parent::init();
        $this->behavior = new HousingBehavior();
        $this->attachBehavior("Housingbehavior", $this->behavior);
        $this->event = new HousingEvent();
    }

    public function actionHousingadd($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::add($this->getModels_ServiceAdd(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionHousingedit($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::modify($this->getModels_ServiceEdit(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionHousingdelete($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::delete($this->getModels_ServiceDelete(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionHousinglist($data) {

        $this->event->set($data, BaseBehavior::FETCH_ALL_ACTION);
        parent::fetch_all($this->getModels_ServiceList(), $this->event, false);
        $this->event->Display();
        return 0;
    }


}
