<?php
namespace console\models\housing;

use console\models\BaseModel;

class BaseHousing extends BaseModel {

    const TABLE_NAME = "housing";

    public function primaryKey() {
        return ['id' => 'auto'];
    }

    protected function resolveFields($v = array(), $default_arr = array()) {

        $subset = array(
            "id",
            "building_id",
            "floor",
            "unit_num",
            "room_num",
            "area",
            "decoration_status",
            "investment_status",
            "unit_price",
            "unit_unit",
            'uid',
            'creatTime',
            'nowTime',
            'seller_id',
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
        $event->set_housing_id($seq_no);
    }

    public static function setEditData($event, $id, $nowTime, $newData, $oldData){

        if (isset($newData["building_id"]) && !empty($newData["building_id"]) && $newData["building_id"] != $oldData["building_id"]) {
            $event->housing_data["building_id"] = $newData["building_id"];
        }

        if (isset($newData["floor"]) && !empty($newData["floor"]) && $newData["floor"] != $oldData["floor"]) {
            $event->housing_data["floor"] = $newData["floor"];
        }

        if (isset($newData["unit_num"]) && !empty($newData["unit_num"]) && $newData["unit_num"] != $oldData["unit_num"]) {
            $event->housing_data["unit_num"] = $newData["unit_num"];
        }

        if (isset($newData["room_num"]) && !empty($newData["room_num"]) && $newData["room_num"] != $oldData["room_num"]) {
            $event->housing_data["room_num"] = $newData["room_num"];
        }

        if (isset($newData["area"]) && !empty($newData["area"]) && $newData["area"] != $oldData["area"]) {
            $event->housing_data["area"] = $newData["area"];
        }
        if (isset($newData["decoration_status"]) && !empty($newData["decoration_status"]) && $newData["decoration_status"] != $oldData["decoration_status"]) {
            $event->housing_data["decoration_status"] = $newData["decoration_status"];
        }
        if (isset($newData["investment_status"]) && !empty($newData["investment_status"]) && $newData["investment_status"] != $oldData["investment_status"]) {
            $event->housing_data["investment_status"] = $newData["investment_status"];
        }
        if (isset($newData["unit_price"]) && !empty($newData["unit_price"]) && $newData["unit_price"] != $oldData["unit_price"]) {
            $event->housing_data["unit_price"] = $newData["unit_price"];
        }
        if (isset($newData["unit_unit"]) && !empty($newData["unit_unit"]) && $newData["unit_unit"] != $oldData["unit_unit"]) {
            $event->housing_data["unit_unit"] = $newData["unit_unit"];
        }
        if (isset($newData["remarks"]) && !empty($newData["remarks"]) && $newData["remarks"] != $oldData["remarks"]) {
            $event->housing_data["remarks"] = $newData["remarks"];
        }


        if (!empty($event->housing_data)) {
            $event->housing_data["id"] = $id;
            $event->housing_data["nowTime"] = $nowTime;
        }
    }

    public function delete($event) {

        $data = $event->housing_data;

        if (!empty($data)) {

            $sql = "UPDATE housing SET is_delete=1 WHERE seller_id = :sellerId AND id = :Id";
            $params = array(
                ":sellerId" => $data["sellerId"],
                ":Id" => $data["id"],
            );

            $this->update_sql($sql, $event, $params);

        }
    }

}
