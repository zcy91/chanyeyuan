<?php
namespace console\controllers\businessservicecategory;

use console\behaviors\businessServiceCategory\BusinessServiceCategoryBehavior;
use console\behaviors\service\ServiceBehavior;
use console\events\business_service_category\BusinessServiceCategoryEvent;
use console\events\service\ServiceEvent;
use console\controllers\BaseController;
use console\behaviors\BaseBehavior;

class BusinessServiceCategoryController extends BaseController {

    public function init() {
        parent::init();
        $this->behavior = new BusinessServiceCategoryBehavior();
        $this->attachBehavior("BusinessServiceCategorybehavior", $this->behavior);
        $this->event = new BusinessServiceCategoryEvent();
    }

    public function actionBusinessservicecategoryadd($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::add($this->getModels_ServiceAdd(), $this->event);
        $this->event->Display();
        return 0;
    }
    public function actionBusinessservicecategorybanneradd($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::add($this->getModels_ServiceBannerAdd(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionBusinessservicecategoryedit($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::modify($this->getModels_ServiceEdit(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionBusinessservicecategorydelete($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::delete($this->getModels_ServiceDelete(), $this->event);
        $this->event->Display();
        return 0;
    }
    public function actionBusinessservicecategorybannerdelete($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::delete($this->getModels_ServiceBannerDelete(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionBusinessservicecategorylist($data) {

        $this->event->set($data, BaseBehavior::FETCH_ALL_ACTION);
        parent::fetch_all($this->getModels_ServiceList(), $this->event, false);
        $this->event->Display();
        return 0;
    }
}
