<?php
namespace console\models\service;

use console\models\BaseModel;
use console\models\base\BaseProductOperate;
use console\models\service\BaseService;
use console\models\service\View_BaseService;
use console\models\user\View_UserLogin;
use console\models\base\View_BaseAttr;
use console\models\base\View_BaseProductcategory;
use console\models\base\View_BaseProductCommission;

class InitData_BaseService extends BaseModel {

    private $sellerId;

    public function serviceAdd($event){
        $data = &$event->RequestArgs;
        if (empty($data) || !isset($data["name"]) || empty($data["icon"])) {
            return parent::go_error($event, -12);
        }
        //判断名字是否重复
        $name = $data['name'];
        $model = new View_BaseService();
        $count = $model -> checkName(0,$name,$event);
        if($count > 0){
            return parent::go_error($event, -5044);
        }
        $ownSellerId = $this->sellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $nowTime = date('Y-m-d H:i:s');
        $event->service_data = array(
            "name" => $data["name"],
            "icon" => $data["icon"],
            "is_show" => (isset($data["is_show"]) && is_string($data["is_show"]) && !empty($data["is_show"])) ? $data["is_show"] : 0,
            "des" => (isset($data["des"]) && is_string($data["des"]) && !empty($data["des"])) ? $data["des"] : "",
            "seller_id" => $ownSellerId,
            "creatTime" => $nowTime,
            "uid" => $data['uid'],
            "sort" => (isset($data["sort"]) && is_string($data["sort"]) && !empty($data["sort"])) ? $data["sort"] : 0,
            "information" => (isset($data["information"]) && is_string($data["information"]) && !empty($data["information"])) ? $data["information"] : '',

        );
    }

    public function serviceBannerAdd($event){
        $data = &$event->RequestArgs;

        if (empty($data) || !isset($data["banner"]) ) {
            return parent::go_error($event, -12);
        }

        $ownSellerId = $this->sellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $nowTime = date('Y-m-d H:i:s');
        $event->service_banner_data = array(
            "banner" => $data["banner"],
            "url" => $data["url"],
            "seller_id" => $ownSellerId,
            "creatTime" => $nowTime,
            "uid" => $data['uid'],
            "title"=>$data['title'],
            "sort"=>$data['sort'],
            'is_hot'=>$data['is_hot']
        );
//        var_dump($event->service_banner_data);
    }

    public function serviceBannerEdit($event){
        $data = &$event->RequestArgs;
        if (empty($data) ||
            !isset($data["id"]) || empty($data["id"]) || !is_numeric($data["id"])) {
            return $this->go_error($event, -12);
        }

        $ownSellerId = $this->sellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $View_BaseService = new View_BaseService();

        $id = $event->serviceId = $data["id"];
        $oldProduct = $View_BaseService->getOneBanner($event, $id, $ownSellerId);
        unset($View_BaseProduct);
        if (empty($oldProduct)) {
            return parent::go_error($event, -2132);
        }
        $nowTime = date('Y-m-d H:i:s');
        $newProduct = $data;
        $newProduct['url'] = !empty($newProduct['url'][0])?$newProduct['url'][0]:'';
        BaseService::setEditBannerData($event,$id,$nowTime,$newProduct,$oldProduct);
    }

    public function serviceEdit($event){
        $data = &$event->RequestArgs;
        if (empty($data) ||
            !isset($data["id"]) || empty($data["id"]) || !is_numeric($data["id"])) {
            return $this->go_error($event, -12);
        }

        $ownSellerId = $this->sellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $View_BaseService = new View_BaseService();
        $count = $View_BaseService->checkName($data['id'],$data['name'],$event);
        if($count > 0){
            return parent::go_error($event, -5044);
        }
        $id = $event->serviceId = $data["id"];
        $oldProduct = $View_BaseService->getOne($event, $id, $ownSellerId);
        unset($View_BaseProduct);
        if (empty($oldProduct)) {
            return parent::go_error($event, -2132);
        }
        $nowTime = date('Y-m-d H:i:s');
        $newProduct = $data;
        BaseService::setEditData($event,$id,$nowTime,$newProduct,$oldProduct);
    }

    public function serviceDelete($event){

        $data = &$event->RequestArgs;

        if (empty($data) || !isset($data["id"]) || empty($data["id"]) || !is_numeric($data["id"])) {
            return parent::go_error($event, -12);
        }

        $ownSellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }

        $id = $event->serviceId = $data["id"];

        $View_BaseService = new View_BaseService();
        $oldProduct = $View_BaseService->getOne($event, $id, $ownSellerId);
        unset($View_BaseProduct);
        if (empty($oldProduct)) {
            return parent::go_error($event, -2132);
        }

        $event->service_data = array(
            "id" => $id,
            "sellerId" => $ownSellerId
        );
    }

    public function serviceBannerDelete($event){

        $data = &$event->RequestArgs;

        if (empty($data) || !isset($data["id"]) || empty($data["id"]) || !is_numeric($data["id"])) {
            return parent::go_error($event, -12);
        }

        $ownSellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }

        $id = $event->serviceId = $data["id"];

        $View_BaseService = new View_BaseService();
        $oldProduct = $View_BaseService->getOneBanner($event, $id, $ownSellerId);
        unset($View_BaseProduct);
        if (empty($oldProduct)) {
            return parent::go_error($event, -2132);
        }
        $event->service_banner_data = array(
            "id" => $id,
            "sellerId" => $ownSellerId
        );
    }

}
