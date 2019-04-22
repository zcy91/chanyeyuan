<?php
namespace console\models\businessServiceCategory;

use console\models\BaseModel;

class BaseBusinessServiceCategory extends BaseModel {

    const TABLE_NAME = "business_service_category";

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
            'parent_id',
            'des',
            'level'
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
        $event->set_category_id($seq_no);
    }

    public static function setEditData($event, $id, $nowTime, $newData, $oldData){

        if (isset($newData["name"]) && !empty($newData["name"]) && $newData["name"] != $oldData["name"]) {
            $event->business_service_category_data["name"] = $newData["name"];
        }

        if (isset($newData["image"]) && !empty($newData["image"]) && $newData["image"] != $oldData["image"]) {
            $event->business_service_category_data["image"] = $newData["image"];
        }

        if (isset($newData["is_show"]) && !empty($newData["is_show"]) && $newData["is_show"] != $oldData["is_show"]) {
            $event->business_service_category_data["is_show"] = $newData["is_show"];
        }

        if (isset($newData["sort"]) && !empty($newData["sort"]) && $newData["sort"] != $oldData["sort"]) {
            $event->business_service_category_data["sort"] = $newData["sort"];
        }
        if (isset($newData["parent_id"]) && !empty($newData["parent_id"]) && $newData["sort"] != $oldData["parent_id"]) {
            $event->business_service_category_data["parent_id"] = $newData["parent_id"];
        }
        if (isset($newData["des"]) && !empty($newData["des"]) && $newData["des"] != $oldData["des"]) {
            $event->business_service_category_data["des"] = $newData["des"];
        }


        if (!empty($event->business_service_category_data)) {
            $event->business_service_category_data["id"] = $id;
            $event->business_service_category_data["nowTime"] = $nowTime;
        }
    }

    public function delete($event) {

        $data = $event->business_service_category_data;

        if (!empty($data)) {

            $sql = "DELETE FROM business_service_category WHERE seller_id = :sellerId AND id = :Id";
            $params = array(
                ":sellerId" => $data["sellerId"],
                ":Id" => $data["id"],
            );

            $this->update_sql($sql, $event, $params);

        }
    }

}
