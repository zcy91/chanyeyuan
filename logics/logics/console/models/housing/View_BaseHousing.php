<?php
namespace console\models\housing;

use console\models\BaseModel;

class View_BaseHousing extends BaseModel {

    public function getOne($event, $productId, $sellerId){
        $sql = "SELECT *
                FROM housing AS bp
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
                FROM housing AS bp 
                WHERE bp.seller_id = :sellerId
                      $condition
                ORDER BY bp.creatTime";
        $result = $this->query_SQL($sql, $event, $limit, $params);

        return $result;
    }
    public function getAllHousing($event, $ispage, $condition, $params, $limit) {
        $sql = "SELECT " . ($ispage ? " sql_calc_found_rows " : "") . "
                      *
                FROM housing AS bp left join investment_status AS hs ON bp.investment_status
                 = hs.investment_id
                left join decoration_status AS rt ON bp.decoration_status=rt.decoration_id
                left join housing_unit AS hu ON bp.unit_unit=hu.unit_id
                WHERE bp.seller_id = :sellerId
                      $condition
                ORDER BY bp.creatTime";
        $result = $this->query_SQL($sql, $event, $limit, $params);

        return $result;
    }

}
