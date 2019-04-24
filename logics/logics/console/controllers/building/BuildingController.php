<?php
namespace console\controllers\building;

use console\behaviors\building\BuildingBehavior;


use console\controllers\BaseController;
use console\behaviors\BaseBehavior;
use console\events\building\BuildingEvent;

class BuildingController extends BaseController {

    public function init() {
        parent::init();
        $this->behavior = new BuildingBehavior();
        $this->attachBehavior("Buildingbehavior", $this->behavior);
        $this->event = new BuildingEvent();
    }

    public function actionBuildingadd($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::add($this->getModels_ServiceAdd(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionBuildingedit($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::modify($this->getModels_ServiceEdit(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionBuildingdelete($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::delete($this->getModels_ServiceDelete(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionBuildinglist($data) {

        $this->event->set($data, BaseBehavior::FETCH_ALL_ACTION);
        parent::fetch_all($this->getModels_ServiceList(), $this->event, false);
        $this->event->Display();
        return 0;
    }


}
