<?php
namespace console\models\customer;

use console\models\BaseModel;

class View_BaseCustomer extends BaseModel {

    public function getOne($event, $productId, $sellerId){
        $sql = "SELECT *
                FROM customer AS bp
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

    public function getBusinessId($event,$seller_id){
        $sql = "SELECT businessId FROM system_index WHERE seller_id = :seller_id AND names = '客户管理' ";
        $params = array(
            ":seller_id" => $seller_id,
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
                     bp.* ,cc.channel_name,ct.type_name
                FROM customer AS bp 
                left join customer_channel AS cc ON cc.channel_id=bp.channels
                left join customer_type AS ct ON ct.type_id=bp.type             
                WHERE bp.seller_id = :sellerId  AND bp.is_delete=0 
                      $condition
                ORDER BY bp.creatTime";
        $result = $this->query_SQL($sql, $event, $limit, $params);
        return $result;
    }


}
