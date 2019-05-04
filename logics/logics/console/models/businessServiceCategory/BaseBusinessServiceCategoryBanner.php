<?php
namespace console\models\businessServiceCategory;

use console\models\BaseModel;

class BaseBusinessServiceCategoryBanner extends BaseModel {

    const TABLE_NAME = "business_service_category_banner";

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
            'title',
            'cid'
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




    public function delete($event) {

        $data = $event->business_service_category_banner_data;

        if (!empty($data)) {

            $sql = "DELETE FROM business_service_category_banner WHERE seller_id = :sellerId AND id = :Id";
            $params = array(
                ":sellerId" => $data["sellerId"],
                ":Id" => $data["id"],
            );

            $this->update_sql($sql, $event, $params);

        }
    }

}
