<?php
namespace console\models\building;

use console\models\BaseModel;
use console\models\base\BaseProductOperate;
use console\models\service\BaseService;
use console\models\service\View_BaseService;
use console\models\user\View_UserLogin;
use console\models\base\View_BaseAttr;
use console\models\base\View_BaseProductcategory;
use console\models\base\View_BaseProductCommission;

class InitData_BaseBuilding extends BaseModel {

    private $sellerId;
    public function buildingAdd($event){
        $data = &$event->RequestArgs;
        if (empty($data) || empty($data['address']) ||empty($data['use']) ||empty($data['floors']) ||empty($data['name'])
            ||empty($data['floor_area']) ||empty($data['image']) ||empty($data['management_area'])||empty($data['floor_area'])
        ) {
            return parent::go_error($event, -12);
        }
        $ownSellerId = $this->sellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $nowTime = date('Y-m-d H:i:s');
        $num = $this->get_num($ownSellerId,$event) + 1;


        $event->building_data = array(
            "name" => $data["name"],
            "address" => $data["address"],
            "use" => (isset($data["use"])  && !empty($data["use"])) ? $data["use"] : 1,
            "image" => $data["image"],
            "floors" =>(isset($data["floors"])  && !empty($data["floors"])) ? $data["floors"] : 1,
            "starting_floor" => (isset($data["starting_floor"])  && !empty($data["starting_floor"])) ? $data["starting_floor"] : 1,
            "end_floor" => (isset($data["end_floor"])  && !empty($data["end_floor"])) ? $data["end_floor"] : 1,
            "floor_area" => (isset($data["floor_area"])  && !empty($data["floor_area"])) ? $data["floor_area"] : 0,
            "management_area" => (isset($data["management_area"])  && !empty($data["management_area"])) ? $data["management_area"] : 0,
            "seller_id" => $ownSellerId,
            "creatTime" => $nowTime,
            "uid" => $data['uid'],
            "num" => $num
        );

    }

    public function buildingEdit($event){
        $data = &$event->RequestArgs;
        if (empty($data) ||
            !isset($data["id"]) || empty($data["id"]) || !is_numeric($data["id"])) {
            return $this->go_error($event, -12);
        }

        $ownSellerId = $this->sellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $View_Base = new View_BaseBuilding();

        $id = $event->Id = $data["id"];
        $oldProduct = $View_Base->getOne($event, $id, $ownSellerId);
        if (empty($oldProduct)) {
            return parent::go_error($event, -2132);
        }
        $nowTime = date('Y-m-d H:i:s');
        $newProduct = $data;
        BaseBuilding::setEditData($event,$id,$nowTime,$newProduct,$oldProduct);
    }

    public function buildingDelete($event){

        $data = &$event->RequestArgs;

        if (empty($data) || !isset($data["id"]) || empty($data["id"]) || !is_numeric($data["id"])) {
            return parent::go_error($event, -12);
        }

        $ownSellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $id = $event->Id = $data["id"];
        $View_Base = new View_BaseBuilding();
        $oldProduct = $View_Base->getOne($event, $id, $ownSellerId);
        if (empty($oldProduct)) {
            return parent::go_error($event, -2132);
        }
        $event->building_data = array(
            "id" => $id,
            "sellerId" => $ownSellerId
        );
    }

    public function get_num($seller_id = 1,$event){
        $seller_id = $seller_id;
        $condition = "seller_id = :seller_id ";
        $args = array(
            ":seller_id" => $seller_id,

        );
        $result = $this->count("building",$condition,$args,'id',$event);
        return $result;

    }

}
