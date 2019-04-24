<?php
namespace console\models\repair;

use console\models\BaseModel;

class BaseRepair extends BaseModel {

    const TABLE_NAME = "repair";

    public function primaryKey() {
        return ['id' => 'auto'];
    }

    protected function resolveFields($v = array(), $default_arr = array()) {

        $subset = array(
            "id",
            "type",
            "address",
            "source",
            "phone",
            "contacts",
            "seller_id",
            "urgency",
            "creatTime",
            "nowTime",
            'uid',
            'detail',
            'job_sn',
            'status',
            'handler',
            'handle_phone',
            'handleTime',
            'remarks'
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
        $event->set_repair_id($seq_no);
    }

    public static function setEditData($event, $id, $nowTime, $newData, $oldData){

        if (isset($newData["type"]) && !empty($newData["type"]) && $newData["type"] != $oldData["type"]) {
            $event->repair_data["type"] = $newData["type"];
        }

        if (isset($newData["address"]) && !empty($newData["address"]) && $newData["address"] != $oldData["address"]) {
            $event->repair_data["address"] = $newData["address"];
        }

        if (isset($newData["source"]) && !empty($newData["source"]) && $newData["source"] != $oldData["source"]) {
            $event->repair_data["source"] = $newData["source"];
        }

        if (isset($newData["phone"]) && !empty($newData["phone"]) && $newData["phone"] != $oldData["phone"]) {
            $event->repair_data["phone"] = $newData["phone"];
        }

        if (isset($newData["contacts"]) && !empty($newData["contacts"]) && $newData["contacts"] != $oldData["contacts"]) {
            $event->repair_data["contacts"] = $newData["contacts"];
        }
        if (isset($newData["urgency"]) && !empty($newData["urgency"]) && $newData["urgency"] != $oldData["urgency"]) {
            $event->repair_data["urgency"] = $newData["urgency"];
        }
        if (isset($newData["detail"]) && !empty($newData["detail"]) && $newData["detail"] != $oldData["detail"]) {
            $event->repair_data["detail"] = $newData["detail"];
        }
        if (isset($newData["status"]) && !empty($newData["status"]) && $newData["status"] != $oldData["status"]) {
            $event->repair_data["status"] = $newData["status"];
        }
        if (isset($newData["handler"]) && !empty($newData["handler"]) && $newData["handler"] != $oldData["handler"]) {
            $event->repair_data["handler"] = $newData["handler"];
        }
        if (isset($newData["handle_phone"]) && !empty($newData["handle_phone"]) && $newData["handle_phone"] != $oldData["handle_phone"]) {
            $event->repair_data["handle_phone"] = $newData["handle_phone"];
        }
        if (isset($newData["remarks"]) && !empty($newData["remarks"]) && $newData["remarks"] != $oldData["remarks"]) {
            $event->repair_data["remarks"] = $newData["remarks"];
        }
        if (isset($newData["handleTime"]) && !empty($newData["handleTime"]) && $newData["handleTime"] != $oldData["handleTime"]) {
            $event->repair_data["handleTime"] = $newData["handleTime"];
        }

        if (!empty($event->repair_data)) {
            $event->repair_data["id"] = $id;
            $event->repair_data["nowTime"] = $nowTime;
        }
    }

    public function delete($event) {

        $data = $event->repair_data;

        if (!empty($data)) {

            $sql = "DELETE FROM repair WHERE seller_id = :sellerId AND id = :Id";
            $params = array(
                ":sellerId" => $data["sellerId"],
                ":Id" => $data["id"],
            );

            $this->update_sql($sql, $event, $params);

        }
    }

}
