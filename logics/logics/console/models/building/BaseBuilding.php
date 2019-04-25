<?php
namespace console\models\building;

use console\models\BaseModel;

class BaseBuilding extends BaseModel {

    const TABLE_NAME = "building";

    public function primaryKey() {
        return ['id' => 'auto'];
    }

    protected function resolveFields($v = array(), $default_arr = array()) {

        $subset = array(
            "id",
            "name",
            "address",
            "source",
            "use",
            "floors",
            "seller_id",
            "starting_floor",
            "creatTime",
            "nowTime",
            'uid',
            'end_floor',
            'floor_area',
            'management_area',
            'builtTime',
            'image',
            'num'

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
        $event->set_building_id($seq_no);
    }

    public static function setEditData($event, $id, $nowTime, $newData, $oldData){

        if (isset($newData["name"]) && !empty($newData["name"]) && $newData["name"] != $oldData["name"]) {
            $event->building_data["name"] = $newData["name"];
        }

        if (isset($newData["address"]) && !empty($newData["address"]) && $newData["address"] != $oldData["address"]) {
            $event->building_data["address"] = $newData["address"];
        }

        if (isset($newData["use"]) && !empty($newData["use"]) && $newData["use"] != $oldData["use"]) {
            $event->building_data["use"] = $newData["use"];
        }

        if (isset($newData["floors"]) && !empty($newData["floors"]) && $newData["floors"] != $oldData["floors"]) {
            $event->building_data["floors"] = $newData["floors"];
        }

        if (isset($newData["starting_floor"]) && !empty($newData["starting_floor"]) && $newData["starting_floor"] != $oldData["starting_floor"]) {
            $event->building_data["starting_floor"] = $newData["starting_floor"];
        }
        if (isset($newData["end_floor"]) && !empty($newData["end_floor"]) && $newData["end_floor"] != $oldData["end_floor"]) {
            $event->building_data["end_floor"] = $newData["end_floor"];
        }
        if (isset($newData["floor_area"]) && !empty($newData["floor_area"]) && $newData["floor_area"] != $oldData["floor_area"]) {
            $event->building_data["floor_area"] = $newData["floor_area"];
        }
        if (isset($newData["management_area"]) && !empty($newData["management_area"]) && $newData["management_area"] != $oldData["management_area"]) {
            $event->building_data["management_area"] = $newData["management_area"];
        }
        if (isset($newData["builtTime"]) && !empty($newData["builtTime"]) && $newData["builtTime"] != $oldData["builtTime"]) {
            $event->building_data["builtTime"] = $newData["builtTime"];
        }
        if (isset($newData["image"]) && !empty($newData["image"]) && $newData["image"] != $oldData["image"]) {
            $event->building_data["image"] = $newData["image"];
        }

        if (!empty($event->building_data)) {
            $event->building_data["id"] = $id;
            $event->building_data["nowTime"] = $nowTime;
        }
    }

    public function delete($event) {

        $data = $event->building_data;

        if (!empty($data)) {

            $sql = "UPDATE building SET is_delete=1 WHERE seller_id = :sellerId AND id = :Id";
            $params = array(
                ":sellerId" => $data["sellerId"],
                ":Id" => $data["id"],
            );

           $this->update_sql($sql, $event, $params);

        }
    }

}
