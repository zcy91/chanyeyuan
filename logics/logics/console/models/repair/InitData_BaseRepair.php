<?php
namespace console\models\repair;

use console\models\BaseModel;
use console\models\base\BaseProductOperate;
use console\models\service\BaseService;
use console\models\service\View_BaseService;
use console\models\user\View_UserLogin;
use console\models\base\View_BaseAttr;
use console\models\base\View_BaseProductcategory;
use console\models\base\View_BaseProductCommission;

class InitData_BaseRepair extends BaseModel {

    private $sellerId;
    public function repairAdd($event){
        $data = &$event->RequestArgs;
        if (empty($data) || empty($data['phone']) ||empty($data['detail']) ||empty($data['contacts'])
            ||empty($data['address'])
        ) {
            return parent::go_error($event, -12);
        }

        $ownSellerId = $this->sellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $nowTime = date('Y-m-d H:i:s');
        $event->repair_data = array(
            "type" =>  (isset($data["type"]) && is_string($data["type"]) && !empty($data["type"])) ? $data["type"] : 1,
            "source" => (isset($data["source"]) && is_string($data["source"]) && !empty($data["source"])) ? $data["source"] : 1,
            "phone" => $data["phone"],
            "contacts" => $data["contacts"],
            "urgency" => (isset($data["urgency"]) && is_string($data["urgency"]) && !empty($data["urgency"])) ? $data["urgency"] : 1,
            "detail" => $data["detail"],
            "job_sn" =>(isset($data["job_sn"]) && is_string($data["job_sn"]) && !empty($data["job_sn"])) ? $data["job_sn"] : '',
            "status" => (isset($data["status"]) && is_string($data["status"]) && !empty($data["status"])) ? $data["status"] : 1,
            "handler" => (isset($data["handler"]) && is_string($data["handler"]) && !empty($data["handler"])) ? $data["handler"] : '',
            "handleTime" => (isset($data["handleTime"]) && is_string($data["handleTime"]) && !empty($data["handleTime"])) ? $data["handleTime"] : '',
            "handle_phone" => (isset($data["handle_phone"]) && is_string($data["handle_phone"]) && !empty($data["handle_phone"])) ? $data["handle_phone"] : '',
            "remarks" => (isset($data["remarks"]) && is_string($data["remarks"]) && !empty($data["remarks"])) ? $data["remarks"] : '',
            "address" => $data["address"],
//            "is_show" => (isset($data["is_show"]) && is_string($data["is_show"]) && !empty($data["is_show"])) ? $data["is_show"] : 0,
//            "des" => (isset($data["des"]) && is_string($data["des"]) && !empty($data["des"])) ? $data["des"] : "",
            "seller_id" => $ownSellerId,
            "creatTime" => $nowTime,
            "uid" => $data['uid'],
        );
    }

    public function repairEdit($event){
        $data = &$event->RequestArgs;
        if (empty($data) ||
            !isset($data["id"]) || empty($data["id"]) || !is_numeric($data["id"])) {
            return $this->go_error($event, -12);
        }
//        if ( empty($data['phone']) ||empty($data['detail']) ||empty($data['contacts'])
//            ||empty($data['address'])
//        ) {
//            return parent::go_error($event, -12);
//        }
        $ownSellerId = $this->sellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $View_Base = new View_BaseRapair();

        $id = $event->repairId = $data["id"];
        $oldProduct = $View_Base->getOne($event, $id, $ownSellerId);
        unset($View_BaseProduct);
        if (empty($oldProduct)) {
            return parent::go_error($event, -2132);
        }
        $nowTime = date('Y-m-d H:i:s');
        $newProduct = $data;
        BaseRepair::setEditData($event,$id,$nowTime,$newProduct,$oldProduct);
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

}
