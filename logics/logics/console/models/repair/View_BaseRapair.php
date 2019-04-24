<?php
namespace console\models\repair;

use console\models\BaseModel;

class View_BaseRapair extends BaseModel {

    public function getOne($event, $productId, $sellerId){
        $sql = "SELECT *
                FROM repair AS bp
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
                      *
                FROM repair AS bp 
                WHERE bp.seller_id = :sellerId
                      $condition
                ORDER BY bp.creatTime";
        $result = $this->query_SQL($sql, $event, $limit, $params);

        return $result;
    }
    public function getAllRepair($event, $ispage, $condition, $params, $limit) {
        $sql = "SELECT " . ($ispage ? " sql_calc_found_rows " : "") . "
                      *
                FROM repair AS bp left join handle_status AS hs ON bp.status=hs.handle_id
                left join repair_type AS rt ON bp.status=rt.type_id
                left join repair_source AS rs ON bp.source=rs.source_id
                left join repair_urgency AS ru ON bp.urgency=ru.urgency_id
                WHERE bp.seller_id = :sellerId
                      $condition
                ORDER BY bp.creatTime";
        $result = $this->query_SQL($sql, $event, $limit, $params);

        return $result;
    }

}
