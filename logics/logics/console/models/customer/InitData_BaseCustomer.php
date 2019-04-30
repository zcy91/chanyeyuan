<?php
namespace console\models\customer;

use console\models\BaseModel;
use console\models\base\BaseProductOperate;
use console\models\service\BaseService;
use console\models\service\View_BaseService;
use console\models\user\View_UserLogin;
use console\models\base\View_BaseAttr;
use console\models\base\View_BaseProductcategory;
use console\models\base\View_BaseProductCommission;

class InitData_BaseCustomer extends BaseModel {
    private $sellerId;

    public function customerAdd($event){
        $data = &$event->RequestArgs;
        if (empty($data) || empty($data['name']) ||empty($data['industry']) ||empty($data['type']) ||empty($data['channels'])
            ||empty($data['area']) ||empty($data['visitingTime'])
        ) {
            return parent::go_error($event, -12);
        }


        $ownSellerId = $this->sellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $nowTime = date('Y-m-d H:i:s');
        $event->customer_data = array(
            "id" => &$event->Id,
            "name" => $data["name"],
            "industry" => $data["industry"],
            "type" => $data["type"],
            "channels" => $data["channels"],
            "area" => $data["area"],
            "visitingTime" => $data["visitingTime"],
            "contact" => !empty($data["contact"])?$data['contact']:'',
            "phone" => !empty($data["phone"])?$data['phone']:'',
            "seller_id" => $ownSellerId,
            "creatTime" => $nowTime,
            "uid" => $data['uid'],
            "email" => !empty($data['email'])?$data['email']:'',
            "address" => !empty($data['address'])?$data['address']:"",
            'code' => !empty($data['code'])?$data['code']:'',
            'taxpayer_id' => !empty($data['taxpayer_id'])?$data['taxpayer_id']:'',
            'registration_num' => !empty($data['registration_num']) ? $data['registration_num'] : '',
            'organizational_code' => !empty($data['organizational_code']) ? $data['organizational_code'] : '',
            'remarks' => !empty($data['remarks']) ? $data['remarks'] : '',
            'legal_person' => !empty($data['legal_person']) ? $data['legal_person'] : '',
            'registered_capital' => !empty($data['registered_capital']) ? $data['registered_capital'] : '',
            'company_type' => !empty($data['company_type']) ? $data['company_type'] : '',
            'personnel_scale' => !empty($data['personnel_scale']) ? $data['personnel_scale'] : '',
            'operating_period' => !empty($data['operating_period']) ? $data['operating_period'] : '',
            'approval_date' => !empty($data['approval_date']) ? $data['approval_date'] : '',
            'business_industry' => !empty($data['business_industry']) ? $data['business_industry'] : '',
            'registered_address' => !empty($data['registered_address']) ? $data['registered_address'] : '',
            'business_scope' => !empty($data['business_scope']) ? $data['business_scope'] : '',
            'other' => !empty($data['other']) ? $data['other'] : '',


        );

    }

    public function customerEdit($event){
        $data = &$event->RequestArgs;
        if (empty($data) ||
            !isset($data["id"]) || empty($data["id"]) || !is_numeric($data["id"])) {
            return $this->go_error($event, -12);
        }

        $ownSellerId = $this->sellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $View_Base = new View_BaseCustomer();

        $id = $event->Id = $data["id"];

        $oldProduct = $View_Base->getOne($event, $id, $ownSellerId);
        if (empty($oldProduct)) {
            return parent::go_error($event, -2132);
        }
        $nowTime = date('Y-m-d H:i:s');
        $newProduct = $data;
        BaseCustomer::setEditData($event,$id,$nowTime,$newProduct,$oldProduct);
    }

    public function customerDelete($event){

        $data = &$event->RequestArgs;

        if (empty($data) || !isset($data["id"]) || empty($data["id"]) || !is_numeric($data["id"])) {
            return parent::go_error($event, -12);
        }

        $ownSellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $id = $event->Id = $data["id"];
        $View_Base = new View_BaseCustomer();

        $oldProduct = $View_Base->getOne($event, $id, $ownSellerId);
        if (empty($oldProduct)) {
            return parent::go_error($event, -2132);
        }
        $event->customer_data = array(
            "id" => $id,
            "sellerId" => $ownSellerId
        );
    }

}
