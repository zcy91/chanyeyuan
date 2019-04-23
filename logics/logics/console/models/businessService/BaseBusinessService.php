<?php
namespace console\models\businessService;

use console\models\BaseModel;

class BaseBusinessService extends BaseModel {

    const TABLE_NAME = "business_service";

    public function primaryKey() {
        return ['id' => 'auto'];
    }

    protected function resolveFields($v = array(), $default_arr = array()) {

        $subset = array(
            "id",
            "name",
            "image",
            "sort",
            "is_show",
            "seller_id",
            "creatTime",
            "nowTime",
            'uid',
            'contacts',
            'remarks',
            'address',
            'cat_id',
            'phone'
        );

        $info_arr = parent::key_values_intersect($v, $subset, $default_arr);
        return $info_arr;
    }

    public function get_seq_no($event, $data_arr, $array_dim) {

        $count = $array_dim == 1 ? 1 : count($data_arr);
        $seq_no = 0;
        $this->proc_call('getKeyValue', array(503, $count), $seq_no, $event);

        return $seq_no;
    }

    public function refer_to($event, $data_arr, $array_dim, $seq_no, $count) {
        $event->set_business_service_id($seq_no);
    }

    public static function setEditData($event, $id, $nowTime, $newData, $oldData){

        if (isset($newData["name"]) && !empty($newData["name"]) && $newData["name"] != $oldData["name"]) {
            $event->business_service_data["name"] = $newData["name"];
        }

        if (isset($newData["image"]) && !empty($newData["image"]) && $newData["image"] != $oldData["image"]) {
            $event->business_service_data["image"] = $newData["image"];
        }

        if (isset($newData["is_show"]) && !empty($newData["is_show"]) && $newData["is_show"] != $oldData["is_show"]) {
            $event->business_service_data["is_show"] = $newData["is_show"];
        }

        if (isset($newData["sort"]) && !empty($newData["sort"]) && $newData["sort"] != $oldData["sort"]) {
            $event->business_service_data["sort"] = $newData["sort"];
        }
        if (isset($newData["phone"]) && !empty($newData["phone"]) && $newData["phone"] != $oldData["phone"]) {
            $event->business_service_data["phone"] = $newData["phone"];
        }
        if (isset($newData["address"]) && !empty($newData["address"]) && $newData["address"] != $oldData["address"]) {
            $event->business_service_data["address"] = $newData["address"];
        }
        if (isset($newData["remarks"]) && !empty($newData["remarks"]) && $newData["remarks"] != $oldData["remarks"]) {
            $event->business_service_data["remarks"] = $newData["remarks"];
        }
        if (isset($newData["contacts"]) && !empty($newData["contacts"]) && $newData["contacts"] != $oldData["contacts"]) {
            $event->business_service_data["contacts"] = $newData["contacts"];
        }


        if (!empty($event->business_service_data)) {
            $event->business_service_data["id"] = $id;
            $event->business_service_data["nowTime"] = $nowTime;
        }
    }

    public function delete($event) {

        $data = $event->business_service_data;

        if (!empty($data)) {

            $sql = "DELETE FROM business_service WHERE seller_id = :sellerId AND id = :Id";
            $params = array(
                ":sellerId" => $data["sellerId"],
                ":Id" => $data["id"],
            );

            $this->update_sql($sql, $event, $params);

        }
    }

}
