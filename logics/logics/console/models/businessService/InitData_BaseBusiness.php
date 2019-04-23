<?php
namespace console\models\businessService;

use console\models\BaseModel;
use console\models\base\BaseProductOperate;
use console\models\service\BaseService;
use console\models\service\View_BaseService;
use console\models\user\View_UserLogin;
use console\models\base\View_BaseAttr;
use console\models\base\View_BaseProductcategory;
use console\models\base\View_BaseProductCommission;

class InitData_BaseBusiness extends BaseModel {

    private $sellerId;
    public function add($event){
        $data = &$event->RequestArgs;

        //判断名字是否重复
        $name = $data['name'];
        $model = new View_BaseService();
        $count = $model -> checkName(0,$name,$event,'business_service');
        if($count > 0){
            return parent::go_error($event, -5044);
        }
        if (empty($data) || !isset($data["name"]) || empty($data["image"]) || empty($data['address']) ||empty($data['phone']) ||empty($data['remarks'])
            ||empty($data['cat_id']) || empty($data['contacts'])
        ) {
            return parent::go_error($event, -12);
        }
        $ownSellerId = $this->sellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $nowTime = date('Y-m-d H:i:s');
        $event->business_service_data = array(
            "name" => $data["name"],
            "image" => $data["image"],
            "is_show" => (isset($data["is_show"]) && is_string($data["is_show"]) && !empty($data["is_show"])) ? $data["is_show"] : 1,
            "seller_id" => $ownSellerId,
            "creatTime" => $nowTime,
            "uid" => $data['uid'],
            "cat_id" => $data['cat_id'],
            "contacts"=>$data['contacts'],
            "phone" => $data['phone'],
            "address" => $data['address'],
            "sort" => (isset($data["sort"]) && is_string($data["sort"]) && !empty($data["sort"])) ? $data["sort"] : 0,
            "remarks" => $data['remarks']

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
        //判断名字是否重复
        $name = $data['name'];
        $model = new View_BaseService();
        $count = $model -> checkName($data['id'],$name,$event,'business_service');
        if($count > 0){
            return parent::go_error($event, -5044);
        }
        $ownSellerId = $this->sellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $View_BaseBusinessService = new View_BaseBusinessService();
//        $count = $View_BaseService->checkName($data['id'],$data['name'],$event);
//        if($count > 0){
//            return parent::go_error($event, -5044);
//        }
        $id = $event->Id = $data["id"];
        $oldProduct = $View_BaseBusinessService->getOne($event, $id, $ownSellerId);

        unset($View_BaseProduct);
        if (empty($oldProduct)) {
            return parent::go_error($event, -2132);
        }
        $nowTime = date('Y-m-d H:i:s');
        $newProduct = $data;
        BaseBusinessService::setEditData($event,$id,$nowTime,$newProduct,$oldProduct);
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

        $id = $event->Id = $data["id"];

        $View_BaseBusinessService = new View_BaseBusinessService();
        $oldProduct = $View_BaseBusinessService->getOne($event, $id, $ownSellerId);
        unset($View_BaseProduct);
        if (empty($oldProduct)) {
            return parent::go_error($event, -2132);
        }

        $event->business_service_data = array(
            "id" => $id,
            "sellerId" => $ownSellerId
        );
    }

}
