<?php
namespace console\models\housing;

use console\models\BaseModel;
use console\models\base\BaseProductOperate;
use console\models\service\BaseService;
use console\models\service\View_BaseService;
use console\models\user\View_UserLogin;
use console\models\base\View_BaseAttr;
use console\models\base\View_BaseProductcategory;
use console\models\base\View_BaseProductCommission;

class InitData_BaseHousing extends BaseModel {

    private $sellerId;
    public function housingAdd($event){
        $data = &$event->RequestArgs;

        if (empty($data) || empty($data['building_id']) ||empty($data['floor']) ||empty($data['unit_num']) ||empty($data['unit_price'])
            ||empty($data['room_num'])
        ) {
            return parent::go_error($event, -12);
        }

        $ownSellerId = $this->sellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }

        $nowTime = date('Y-m-d H:i:s');
        $event->housing_data = array(
            "building_id" =>  (isset($data["building_id"]) && !empty($data["building_id"])) ? $data["building_id"] : 1,
            "floor" => (isset($data["floor"])  && !empty($data["floor"])) ? $data["floor"] : 1,
            "unit_num" => $data["unit_num"],
            "room_num" => $data["room_num"],
            "area" => (isset($data["area"]) && !empty($data["area"])) ? $data["area"] : 1,
            "decoration_status" =>(isset($data["decoration_status"]) && !empty($data["decoration_status"])) ? $data["decoration_status"] : 1,
            "investment_status" => (isset($data["investment_status"]) && !empty($data["investment_status"])) ? $data["investment_status"] : 1,
            "unit_price" => (isset($data["unit_price"]) && !empty($data["unit_price"])) ? $data["unit_price"] : 0,
            "unit_unit" => (isset($data["unit_unit"]) && !empty($data["unit_unit"])) ? $data["unit_unit"] : 1,
            "remarks" => (isset($data["remarks"]) && is_string($data["remarks"]) && !empty($data["remarks"])) ? $data["remarks"] : '',
            "seller_id" => $ownSellerId,
            "creatTime" => $nowTime,
            "uid" => $data['uid'],
        );
    }

    public function housingEdit($event){
        $data = &$event->RequestArgs;
        if (empty($data) ||
            !isset($data["id"]) || empty($data["id"]) || !is_numeric($data["id"])) {
            return $this->go_error($event, -12);
        }
        $ownSellerId = $this->sellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $View_Base = new View_BaseHousing();

        $id = $event->Id = $data["id"];
        $oldProduct = $View_Base->getOne($event, $id, $ownSellerId);
        unset($View_BaseProduct);
        if (empty($oldProduct)) {
            return parent::go_error($event, -2132);
        }
        $nowTime = date('Y-m-d H:i:s');
        $newProduct = $data;
        BaseHousing::setEditData($event,$id,$nowTime,$newProduct,$oldProduct);
    }

    public function housingDelete($event){

        $data = &$event->RequestArgs;

        if (empty($data) || !isset($data["id"]) || empty($data["id"]) || !is_numeric($data["id"])) {
            return parent::go_error($event, -12);
        }

        $ownSellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }

        $id = $event->Id = $data["id"];

        $View_Base = new View_BaseHousing();
        $oldProduct = $View_Base->getOne($event, $id, $ownSellerId);
        unset($View_BaseProduct);
        if (empty($oldProduct)) {
            return parent::go_error($event, -2132);
        }

        $event->housing_data = array(
            "id" => $id,
            "sellerId" => $ownSellerId
        );
    }

}
