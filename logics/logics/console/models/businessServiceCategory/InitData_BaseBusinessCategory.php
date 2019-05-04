<?php
namespace console\models\businessServiceCategory;

use console\models\BaseModel;
use console\models\base\BaseProductOperate;
use console\models\service\BaseService;
use console\models\service\View_BaseService;
use console\models\user\View_UserLogin;
use console\models\base\View_BaseAttr;
use console\models\base\View_BaseProductcategory;
use console\models\base\View_BaseProductCommission;

class InitData_BaseBusinessCategory extends BaseModel {

    private $sellerId;

    public function add($event){
        $data = &$event->RequestArgs;

        if (empty($data) || !isset($data["name"]) || empty($data["image"])) {
            return parent::go_error($event, -12);
        }
        $ownSellerId = $this->sellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $nowTime = date('Y-m-d H:i:s');
        if(!empty($data['parent_id'])){
            $level = 2;
        }else{
            $level = 1;
        }
        $event->business_service_category_data = array(
            "name" => $data["name"],
            "image" => $data["image"],
            'des' =>(isset($data["des"]) && is_string($data["des"]) && !empty($data["des"])) ? $data["des"] : '',
            "is_show" => (isset($data["is_show"]) && is_string($data["is_show"]) && !empty($data["is_show"])) ? $data["is_show"] : 0,
            'parent_id' =>(isset($data["parent_id"]) && is_string($data["parent_id"]) && !empty($data["parent_id"])) ? $data["parent_id"] : 0,
            "seller_id" => $ownSellerId,
            "creatTime" => $nowTime,
            "uid" => $data['uid'],
            "level"=> $level,
            'is_hot'=>(isset($data["is_hot"]) && is_string($data["is_hot"]) && !empty($data["is_hot"])) ? $data["is_hot"] : 2,
        );
    }
    public function banneradd($event){

        $data = &$event->RequestArgs;
        if (empty($data) || !isset($data["banner"]) ) {
            return parent::go_error($event, -12);
        }
        $ownSellerId = $this->sellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $nowTime = date('Y-m-d H:i:s');
        $event->business_service_category_banner_data = array(
            "banner" => $data["banner"],
            "url" => $data["url"],
            "seller_id" => $ownSellerId,
            "creatTime" => $nowTime,
            "uid" => $data['uid'],
            'title'=>$data['title'],
            'sort'=>$data['sort'],
            'cid'=>$data['cid']
//            'is_hot'=>$data['is_hot']
        );

    }
    public function edit($event){
        $data = &$event->RequestArgs;
        if (empty($data) ||
            !isset($data["id"]) || empty($data["id"]) || !is_numeric($data["id"])) {
            return $this->go_error($event, -12);
        }
        if (!(isset($data["name"]) && !empty($data["name"]) && is_string($data["name"])) ||
            !(isset($data["image"]) && !empty($data["image"]) && is_string($data["image"]))
           )
         {
            return parent::go_error($event, -12);
        }

        $ownSellerId = $this->sellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $View_BaseBusinessServiceCategory = new View_BaseBusinessServiceCategory();
//        $count = $View_BaseService->checkName($data['id'],$data['name'],$event);
//        if($count > 0){
//            return parent::go_error($event, -5044);
//        }
        $id = $event->categoryId = $data["id"];
        $oldProduct = $View_BaseBusinessServiceCategory->getOne($event, $id, $ownSellerId);

        unset($View_BaseProduct);
        if (empty($oldProduct)) {
            return parent::go_error($event, -2132);
        }
        $nowTime = date('Y-m-d H:i:s');
        $newProduct = $data;
        BaseBusinessServiceCategory::setEditData($event,$id,$nowTime,$newProduct,$oldProduct);
    }

    public function delete($event){

        $data = &$event->RequestArgs;

        if (empty($data) || !isset($data["id"]) || empty($data["id"]) || !is_numeric($data["id"])) {
            return parent::go_error($event, -12);
        }

        $ownSellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }

        $id = $event->categoryId = $data["id"];

        $View_BaseBusinessServiceCategory = new View_BaseBusinessServiceCategory();
        $oldProduct = $View_BaseBusinessServiceCategory->getOne($event, $id, $ownSellerId);
        unset($View_BaseProduct);
        if (empty($oldProduct)) {
            return parent::go_error($event, -2132);
        }

        $event->business_service_category_data = array(
            "id" => $id,
            "sellerId" => $ownSellerId
        );
    }
    public function bannerdelete($event){

        $data = &$event->RequestArgs;

        if (empty($data) || !isset($data["id"]) || empty($data["id"]) || !is_numeric($data["id"])) {
            return parent::go_error($event, -12);
        }

        $ownSellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }

        $id = $event->categoryId = $data["id"];

        $View_BaseService = new View_BaseBusinessServiceCategory();
        $oldProduct = $View_BaseService->getOneBanner($event, $id, $ownSellerId);
        unset($View_BaseProduct);
        if (empty($oldProduct)) {
            return parent::go_error($event, -2132);
        }
        $event->business_service_category_banner_data = array(
            "id" => $id,
            "sellerId" => $ownSellerId
        );

    }

}
