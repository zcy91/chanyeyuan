<?php
namespace console\controllers\businessservice;

use console\behaviors\businessService\BusinessServiceBehavior;

use console\events\business_service\BusinessServiceEvent;
use console\controllers\BaseController;
use console\behaviors\BaseBehavior;

class BusinessServiceController extends BaseController {

    public function init() {
        parent::init();
        $this->behavior = new BusinessServiceBehavior();
        $this->attachBehavior("BusinessServicebehavior", $this->behavior);
        $this->event = new BusinessServiceEvent();
    }

    public function actionBusinessserviceadd($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::add($this->getModels_ServiceAdd(), $this->event);
        $this->event->Display();
        return 0;
    }
    public function actionBusinessservicebanneradd($data) {

        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::add($this->getModels_ServiceBannerAdd(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionBusinessserviceedit($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::modify($this->getModels_ServiceEdit(), $this->event);
        $this->event->Display();
        return 0;
    }
    public function actionBusinessservicebanneredit($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::modify($this->getModels_ServiceBannerEdit(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionBusinessservicedelete($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::delete($this->getModels_ServiceDelete(), $this->event);
        $this->event->Display();
        return 0;
    }
    public function actionBusinessservicebannerdelete($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::delete($this->getModels_ServiceBannerDelete(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionBusinessservicelist($data) {

        $this->event->set($data, BaseBehavior::FETCH_ALL_ACTION);
        parent::fetch_all($this->getModels_ServiceList(), $this->event, false);
        $this->event->Display();
        return 0;
    }
}
