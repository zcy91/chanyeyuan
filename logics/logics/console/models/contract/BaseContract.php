<?php
namespace console\models\contract;

use console\models\BaseModel;
use console\models\building\Building;
use Home\Model\ContractModel;
use yii\base\Model;

class BaseContract extends BaseModel {

    const TABLE_NAME = "contract";

    public function primaryKey() {
        return ['id' => 'auto'];
    }

    protected function resolveFields($v = array(), $default_arr = array()) {

        $subset = array(
            "id",
            "contract_sn",
            "follow_man",
            "tenant",
            "industry",
            "legal_person",
            "id_number",
            "tenant_contact",
            "phone",
            "nowTime",
            'uid',
            'housing_id',
            'creatTime',
            'seller_id',
            'housing_id',
            'building_id',
            'startTime',
            'endTime'

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
        $event->set_contract_id($seq_no);
    }

    public static function setEditData($event, $id, $nowTime, $newData, $oldData){

        if (isset($newData["follow_man"]) && !empty($newData["follow_man"]) && $newData["follow_man"] != $oldData["follow_man"]) {
            $event->contract_data["follow_man"] = $newData["follow_man"];
        }

        if (isset($newData["tenant"]) && !empty($newData["tenant"]) && $newData["tenant"] != $oldData["tenant"]) {
            $event->contract_data["tenant"] = $newData["tenant"];
        }

        if (isset($newData["industry"]) && !empty($newData["industry"]) && $newData["industry"] != $oldData["industry"]) {
            $event->contract_data["industry"] = $newData["industry"];
        }

        if (isset($newData["legal_person"]) && !empty($newData["legal_person"]) && $newData["legal_person"] != $oldData["legal_person"]) {
            $event->contract_data["legal_person"] = $newData["legal_person"];
        }
        if (isset($newData["id_number"]) && !empty($newData["id_number"]) && $newData["id_number"] != $oldData["id_number"]) {
            $event->contract_data["id_number"] = $newData["id_number"];
        }
        if (isset($newData["tenant_contact"]) && !empty($newData["tenant_contact"]) && $newData["tenant_contact"] != $oldData["tenant_contact"]) {
            $event->contract_data["tenant_contact"] = $newData["tenant_contact"];
        }
        if (isset($newData["phone"]) && !empty($newData["phone"]) && $newData["phone"] != $oldData["phone"]) {
            $event->contract_data["phone"] = $newData["phone"];
        }
        if (isset($newData["remarks"]) && !empty($newData["remarks"]) && $newData["remarks"] != $oldData["remarks"]) {
            $event->contract_data["remarks"] = $newData["remarks"];
        }
        if (isset($newData["housing_id"]) && !empty($newData["housing_id"]) && $newData["housing_id"] != $oldData["housing_id"]) {
            $event->contract_data["housing_id"] = $newData["housing_id"];
        }
        if (isset($newData["startTime"]) && !empty($newData["startTime"]) && $newData["startTime"] != $oldData["startTime"]) {
            $event->contract_data["startTime"] = $newData["startTime"];
        }

        if (isset($newData["endTime"]) && !empty($newData["endTime"]) ) {
            $event->contract_data["endTime"] = $newData["endTime"];
        }

        if (isset($newData["warningDay"]) && !empty($newData["warningDay"]) && $newData["warningDay"] != $oldData["warningDay"]) {
            $event->contract_data["warningDay"] = $newData["warningDay"];
        }
        if (!empty($event->contract_data)) {
            $event->contract_data["id"] = $id;
            $event->contract_data["nowTime"] = $nowTime;
        }
//        var_dump($newData['housing_id']);
//        var_dump($oldData['housing_id']);
//        var_dump($event->contract_data);
    }

    public function delete($event) {

        $data = $event->contract_data;

        if (!empty($data)) {

            $sql = "UPDATE contract SET is_delete=1 WHERE seller_id = :sellerId AND id = :Id";
            $params = array(
                ":sellerId" => $data["sellerId"],
                ":Id" => $data["id"],
            );
           $res = $this->update_sql($sql, $event, $params);
           if($res){
               $contract_id = $data['id'];
               $sql = " UPDATE  housing SET endTime='',is_use=0,warningDay=1,contract_id='' where contract_id=$contract_id ";
               $res = $this->update_sql($sql, $event, $params=[]);
           }


        }
    }
    public function add($event) {

        $data_arr = $this->get_model_data($event);
        if (empty($data_arr)) {
            return 1;
        }//参数为空数组，则直接返回成功，不做处理

        $return_data = [];
        $merge_data = [];

        //二维数组
        if (isset($data_arr[0]) && is_array($data_arr[0])) {
            if (count($data_arr) == 1) {
                $return_data = $this->single_add_inner($event, $data_arr[0]);

                $merge_data = $this->refer_add_result($event, $data_arr[0], 1, $return_data);
            } else {
                $return_data = $this->batch_add_inner($event, $data_arr);

                $merge_data = $this->refer_add_result($event, $data_arr, 2, $return_data);
            }
        } else {
            $return_data = $this->single_add_inner($event, $data_arr);

            $merge_data = $this->refer_add_result($event, $data_arr, 1, $return_data);
        }

        if ($return_data["error_code"] < 0) {
            return $this->go_error($event, $return_data["error_code"]);
        }

        if (!empty($merge_data)) {
            $return_data = $merge_data;
        }
        //修改housing表
        $contract_id = $return_data['id'];
        $endTime = $data_arr['endTime'];
        $housing_id = $data_arr['housing_id'];
        $warningDay = !empty($data_arr['warningDay']) ? $data_arr['warningDay'] : 1;
        $sql = " UPDATE  housing SET endTime='$endTime',is_use=1,warningDay=$warningDay,contract_id = $contract_id where id=$housing_id";
        $res = $this->update_sql($sql, $event, $params=[]);
//        var_dump($res); 1,0
        //修改building表合同数
       Building::updateAllCounters(['contract_num'=>1],["id"=>$data_arr['building_id']]);
        $event->Postback($return_data, false, $this->get_table_name());
    }

    /**
     * 修改模块信息
     */
    public function modify($event) {

        $data_arr = $this->get_model_data($event);
        if (empty($data_arr)) {
            return 1;
        }//参数为空数组，则直接返回成功，不做处理

        $return_data = [];
        $merge_data = [];

        //二维数组
        if (isset($data_arr[0]) && is_array($data_arr[0])) {
            if (count($data_arr) == 1) {
                $return_data = $this->single_modify_inner($event, $data_arr[0]);
                $merge_data = $this->refer_modify_result($event, $data_arr[0], 1, $return_data);
            } else {
                $return_data = $this->batch_modify_inner($event, $data_arr, true);

                $merge_data = $this->refer_modify_result($event, $data_arr, 2, $return_data);
            }
        } else {
            $return_data = $this->single_modify_inner($event, $data_arr);
            $merge_data = $this->refer_modify_result($event, $data_arr, 1, $return_data);

        }

        if ($return_data["error_code"] < 0) {
            return $this->go_error($event, $return_data["error_code"]);
        }

        if (!empty($merge_data)) {
            $return_data = $merge_data;
        }
        //修改housing表
        if(!empty($data_arr['housing_id'])){
            $housing_id = $data_arr['housing_id'];
            $sql = "SELECT `building_id` from housing where id=$housing_id";
            $arr = $this->query_SQL($sql,$event,1,[]);
            $building_id = $arr[0]['building_id'];
            $contract_id = $data_arr['id'];
            $sql = " UPDATE  housing SET endTime='',is_use=0,warningDay=1,contract_id='' where contract_id=$contract_id ";
            var_dump( $sql);
            $res = $this->update_sql($sql, $event, $params=[]);
            if($res){
                Building::updateAllCounters(['contract_num'=>-1],['id'=>$building_id]);
                $endTime = $data_arr['endTime'];
                $housing_id = $data_arr['housing_id'];
                $warningDay = !empty($data_arr['warningDay']) ? $data_arr['warningDay'] : 1;
                $sql = " UPDATE  housing SET endTime='$endTime',is_use=1,warningDay=$warningDay,contract_id=$contract_id where id=$housing_id";
                $res = $this->update_sql($sql, $event, $params=[]);
                if($res){
                    if(!empty($data_arr['building_id'])){
                        $building_id = $data_arr['building_id'];
                    }
                    Building::updateAllCounters(['contract_num'=>1],['id'=>$building_id]);
                }
            }
        }

        $event->Postback($return_data, false, $this->get_table_name());
    }

}
