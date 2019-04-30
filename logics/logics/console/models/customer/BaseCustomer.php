<?php
namespace console\models\customer;

use console\models\BaseModel;
use console\models\building\Building;
use Home\Model\ContractModel;
use yii\base\Model;

class BaseCustomer extends BaseModel {

    const TABLE_NAME = "customer";

    public function primaryKey() {
        return ['id' => 'auto'];
    }

    protected function resolveFields($v = array(), $default_arr = array()) {

        $subset = array(
            "id",
            "name",
            "industry",
            "type",
            "channels",
            "area",
            "visitingTime",
            "contact",
            "phone",
            "seller_id",
            "creatTime",
            "uid" ,
            "email",
            "address",
            'code',
            'taxpayer_id',
            'registration_num' ,
            'organizational_code',
            'remarks',
            'legal_person',
            'registered_capital',
            'company_type',
            'personnel_scale',
            'operating_period',
            'approval_date' ,
            'business_industry',
            'registered_address',
            'business_scope',
            'other',
            'creatTime',
            'nowTime'

        );

        $info_arr = parent::key_values_intersect($v, $subset, $default_arr);
        return $info_arr;
    }

    public function get_seq_no($event, $data_arr, $array_dim) {

        $count = $array_dim == 1 ? 1 : count($data_arr);
        $seq_no = 0;
        $this->proc_call('getKeyValue', array(600, $count), $seq_no, $event);
        return $seq_no;
    }

    public function refer_to($event, $data_arr, $array_dim, $seq_no, $count) {
        $event->set_customer_id($seq_no);
    }

    public static function setEditData($event, $id, $nowTime, $newData, $oldData){

        if (isset($newData["name"]) && !empty($newData["name"]) && $newData["name"] != $oldData["name"]) {
            $event->customer_data["name"] = $newData["name"];
        }

        if (isset($newData["industry"]) && !empty($newData["industry"]) && $newData["industry"] != $oldData["industry"]) {
            $event->customer_data["industry"] = $newData["industry"];
        }

        if (isset($newData["type"]) && !empty($newData["type"]) && $newData["type"] != $oldData["type"]) {
            $event->customer_data["type"] = $newData["type"];
        }

        if (isset($newData["channels"]) && !empty($newData["channels"]) && $newData["channels"] != $oldData["channels"]) {
            $event->customer_data["channels"] = $newData["channels"];
        }
        if (isset($newData["area"]) && !empty($newData["area"]) && $newData["area"] != $oldData["area"]) {
            $event->customer_data["area"] = $newData["area"];
        }
        if (isset($newData["visitingTime"]) && !empty($newData["visitingTime"]) && $newData["visitingTime"] != $oldData["visitingTime"]) {
            $event->customer_data["visitingTime"] = $newData["visitingTime"];
        }
        if (isset($newData["phone"]) && !empty($newData["phone"]) && $newData["phone"] != $oldData["phone"]) {
            $event->customer_data["phone"] = $newData["phone"];
        }
        if (isset($newData["remarks"]) && !empty($newData["remarks"]) && $newData["remarks"] != $oldData["remarks"]) {
            $event->customer_data["remarks"] = $newData["remarks"];
        }
        if (isset($newData["contact"]) && !empty($newData["contact"]) && $newData["contact"] != $oldData["contact"]) {
            $event->customer_data["contact"] = $newData["contact"];
        }
        if (isset($newData["email"]) && !empty($newData["email"]) && $newData["email"] != $oldData["email"]) {
            $event->customer_data["email"] = $newData["email"];
        }

        if (isset($newData["address"]) && !empty($newData["address"])&& $newData["address"] != $oldData["address"])  {
            $event->customer_data["address"] = $newData["address"];
        }

        if (isset($newData["code"]) && !empty($newData["code"]) && $newData["code"] != $oldData["code"]) {
            $event->customer_data["code"] = $newData["code"];
        }

        if (isset($newData["code"]) && !empty($newData["code"]) && $newData["code"] != $oldData["code"]) {
            $event->customer_data["code"] = $newData["code"];
        }
        if (isset($newData["taxpayer_id"]) && !empty($newData["taxpayer_id"]) && $newData["taxpayer_id"] != $oldData["taxpayer_id"]) {
            $event->customer_data["taxpayer_id"] = $newData["taxpayer_id"];
        }
        if (isset($newData["registration_num"]) && !empty($newData["registration_num"]) && $newData["registration_num"] != $oldData["registration_num"]) {
            $event->customer_data["registration_num"] = $newData["registration_num"];
        }
        if (isset($newData["organizational_code"]) && !empty($newData["organizational_code"]) && $newData["organizational_code"] != $oldData["organizational_code"]) {
            $event->customer_data["organizational_code"] = $newData["organizational_code"];
        }
        if (isset($newData["legal_person"]) && !empty($newData["legal_person"]) && $newData["legal_person"] != $oldData["legal_person"]) {
            $event->customer_data["legal_person"] = $newData["legal_person"];
        }
        if (isset($newData["registered_capital"]) && !empty($newData["registered_capital"]) && $newData["registered_capital"] != $oldData["registered_capital"]) {
            $event->customer_data["registered_capital"] = $newData["registered_capital"];
        }
        if (isset($newData["company_type"]) && !empty($newData["company_type"]) && $newData["company_type"] != $oldData["company_type"]) {
            $event->customer_data["company_type"] = $newData["company_type"];
        }
        if (isset($newData["personnel_scale"]) && !empty($newData["personnel_scale"]) && $newData["personnel_scale"] != $oldData["personnel_scale"]) {
            $event->customer_data["personnel_scale"] = $newData["personnel_scale"];
        } if (isset($newData["operating_period"]) && !empty($newData["operating_period"]) && $newData["operating_period"] != $oldData["operating_period"]) {
            $event->customer_data["operating_period"] = $newData["operating_period"];
        } if (isset($newData["approval_date"]) && !empty($newData["approval_date"]) && $newData["approval_date"] != $oldData["approval_date"]) {
            $event->customer_data["approval_date"] = $newData["approval_date"];
        }
        if (isset($newData["business_industry"]) && !empty($newData["business_industry"]) && $newData["business_industry"] != $oldData["business_industry"]) {
            $event->customer_data["business_industry"] = $newData["business_industry"];
        }

        if (isset($newData["registered_address"]) && !empty($newData["registered_address"]) && $newData["registered_address"] != $oldData["registered_address"]) {
            $event->customer_data["registered_address"] = $newData["registered_address"];
        }
        if (isset($newData["business_scope"]) && !empty($newData["business_scope"]) && $newData["business_scope"] != $oldData["business_scope"]) {
            $event->customer_data["business_scope"] = $newData["business_scope"];
        }
        if (isset($newData["other"]) && !empty($newData["other"]) && $newData["other"] != $oldData["other"]) {
            $event->customer_data["other"] = $newData["other"];
        }
        if (!empty($event->customer_data)) {
            $event->customer_data["id"] = $id;
            $event->customer_data["nowTime"] = $nowTime;
        }
    }

    public function delete($event) {

        $data = $event->customer_data;

        if (!empty($data)) {

            $sql = "UPDATE customer SET is_delete=1 WHERE seller_id = :sellerId AND id = :Id";
            $params = array(
                ":sellerId" => $data["sellerId"],
                ":Id" => $data["id"],
            );
           $res = $this->update_sql($sql, $event, $params);
        }
    }



}
