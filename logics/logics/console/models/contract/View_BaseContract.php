<?php
namespace console\models\contract;

use console\models\BaseModel;

class View_BaseContract extends BaseModel {

    public function getOne($event, $productId, $sellerId){
        $sql = "SELECT *
                FROM contract AS bp
                WHERE bp.seller_id = :sellerId AND bp.id = :Id ";
        $params = array(
            ":sellerId" => $sellerId,
            ":Id" => $productId
        );
        $result = $this->query_SQL($sql, $event, null, $params);

        if (!empty($result)) {
            $result = $result[0];
        }
        return $result;
    }
    public function checkName($id=0,$name,$event,$table_name='service'){
        $condition = "name = :name AND id != :id";
        $args = array(
            ":name" => $name,
            ":id" => $id
        );
        $result = $this->count($table_name,$condition,$args,'id',$event);
        return $result;
    }
    public function getAllProduct($event, $ispage, $condition, $params, $limit) {
        $sql = "SELECT " . ($ispage ? " sql_calc_found_rows " : "") . "
                     bp.* , hg.room_num,hg.area,bg.name
                FROM contract AS bp
                left join housing AS hg ON bp.housing_id=hg.id 
                 left join building AS bg ON bp.housing_id=bg.id
               
                WHERE bp.seller_id = :sellerId  AND bp.is_delete=0 
                      $condition
                ORDER BY bp.creatTime";
        $result = $this->query_SQL($sql, $event, $limit, $params);
        return $result;
    }
    public function get_building_id($event,$housing_id,$limit=1 ,$params=[]){
        $sql = "SELECT `building_id` FROM housing where id = $housing_id and is_delete = 0";
        $result = $this->query_SQL($sql, $event, $limit, $params);
        return $result;
    }
    public function checkUse($event,$housing_id){
        $sql = "SELECT `is_use` FROM housing where id=$housing_id";
        $result = $this->query_SQL($sql, $event, 1, $params=[]);
        if(!empty($result[0]['is_use']) ==1){
            return true;
        }else{
            return false;
        }
    }

    public function get_cost($event,$contract_id){
        $sql = "SELECT ct.* FROM cost as ct  where ct.contract_id = $contract_id and is_delete = 0";
        $result = $this->query_SQL($sql, $event, '', $params=[]);
        return $result;
    }


}
