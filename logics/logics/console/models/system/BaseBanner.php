<?php
namespace console\models\system;

use console\models\BaseModel;

class BaseBanner extends BaseModel {

    const TABLE_NAME = "system_banner";

    public function primaryKey() {
        return ['id' => 'auto'];
    }

    protected function resolveFields($v = array(), $default_arr = array()) {

        $subset = array(
            "id",
            "banner",
            "url",
            "seller_id",
            "creatTime",
            "nowTime",
            'uid',
            'sort',
            'title'
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
        $event->set_system_banner_id($seq_no);
    }

    public static function setEditData($event, $id, $nowTime, $newData, $oldData){

        if (isset($newData["banner"]) && !empty($newData["banner"]) && $newData["banner"] != $oldData["banner"]) {
            $event->system_banner_data["banner"] = $newData["banner"];
        }

        if (isset($newData["url"]) && !empty($newData["url"]) && $newData["url"] != $oldData["url"]) {
            $event->system_banner_data["url"] = $newData["url"];
        }
        if (!empty($event->system_banner_data)) {
            $event->system_banner_data["id"] = $id;
            $event->system_banner_data["nowTime"] = $nowTime;
        }
    }


    public function bannerdelete($event) {

        $data = $event->system_banner_data;

        if (!empty($data)) {

            $sql = "DELETE FROM system_banner WHERE seller_id = :sellerId AND id = :Id";
            $params = array(
                ":sellerId" => $data["sellerId"],
                ":Id" => $data["id"],
            );

            $this->update_sql($sql, $event, $params);

        }
    }



}
