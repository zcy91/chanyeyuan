<?php
namespace console\models\contract;

use console\models\BaseModel;
use console\models\base\BaseProductOperate;
use console\models\service\BaseService;
use console\models\service\View_BaseService;
use console\models\user\View_UserLogin;
use console\models\base\View_BaseAttr;
use console\models\base\View_BaseProductcategory;
use console\models\base\View_BaseProductCommission;

class InitData_BaseContract extends BaseModel {

    private $sellerId;
    public function contractAdd($event){
        $data = &$event->RequestArgs;
        if (empty($data) || empty($data['contract_sn']) ||empty($data['follow_man']) ||empty($data['tenant']) ||empty($data['industry'])
            ||empty($data['legal_person']) ||empty($data['id_number']) ||empty($data['tenant_contact'])||empty($data['phone'])
            ||empty($data['startTime']) ||empty($data['endTime'] || empty($data['housing_id']))
        ) {
            return parent::go_error($event, -12);
        }
        //检查是否已出租
        $housing_id = $data['housing_id'];
        $model = new View_BaseContract();
        $is_use = $model->checkUse($event,$housing_id);
        if($is_use){
            return parent::go_error($event, -5046);
        }
        $ownSellerId = $this->sellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $nowTime = date('Y-m-d H:i:s');
        $model = new View_BaseContract();
        $building_id = $model->get_building_id($event,$data['housing_id']);
        if(empty($building_id)){
            return parent::go_error($event, -12);
        }
        if(strtotime($data['startTime']) > strtotime($data['endTime'])){
            return parent::go_error($event, -12);
        }
        $event->contract_data = array(
            "contract_sn" => $data["contract_sn"],
            "follow_man" => $data["follow_man"],
            "tenant" => $data["tenant"],
            "industry" => $data["industry"],
            "legal_person" => $data["legal_person"],
            "id_number" => $data["id_number"],
            "tenant_contact" => $data["tenant_contact"],
            "phone" => $data["phone"],
            "seller_id" => $ownSellerId,
            "creatTime" => $nowTime,
            "uid" => $data['uid'],
            "housing_id" => $data['housing_id'],
            "building_id" => $building_id[0]['building_id'],
            'startTime' => $data['startTime'],
            'endTime' => $data['endTime'],
            'warningDay' => !empty($data['warningDay']) ? $data['warningDay'] : 1,
        );

    }

    public function contractEdit($event){
        $data = &$event->RequestArgs;
        if (empty($data) ||
            !isset($data["id"]) || empty($data["id"]) || !is_numeric($data["id"])) {
            return $this->go_error($event, -12);
        }

        $ownSellerId = $this->sellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $View_Base = new View_BaseContract();

        $id = $event->Id = $data["id"];
        $oldProduct = $View_Base->getOne($event, $id, $ownSellerId);
        if (empty($oldProduct)) {
            return parent::go_error($event, -2132);
        }
        $nowTime = date('Y-m-d H:i:s');
        $newProduct = $data;
        BaseContract::setEditData($event,$id,$nowTime,$newProduct,$oldProduct);
    }

    public function contractDelete($event){

        $data = &$event->RequestArgs;

        if (empty($data) || !isset($data["id"]) || empty($data["id"]) || !is_numeric($data["id"])) {
            return parent::go_error($event, -12);
        }

        $ownSellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $id = $event->Id = $data["id"];
        $View_Base = new View_BaseContract();

        $oldProduct = $View_Base->getOne($event, $id, $ownSellerId);
        if (empty($oldProduct)) {
            return parent::go_error($event, -2132);
        }
        $event->contract_data = array(
            "id" => $id,
            "sellerId" => $ownSellerId
        );
    }

}
