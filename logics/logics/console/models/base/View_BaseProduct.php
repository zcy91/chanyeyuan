<?php
namespace console\models\base;

use console\models\BaseModel;

class View_BaseProduct extends BaseModel {
    
    public function getOne($event, $productId, $sellerId){
        
        $sql = "SELECT bp.id,
                       bp.dnos,
                       bp.dnames,
                       bp.image,
                       bp.algorithm,
                       bp.isSetAlgorithm,
                       bp.display,
                       bp.descr,
                       bp.seller_id,
                       bp.categoryId
                FROM base_product AS bp
                WHERE bp.seller_id = :sellerId AND bp.id = :productId ";
        
        $params = array(
            ":sellerId" => $sellerId,
            ":productId" => $productId
        );
        
        $result = $this->query_SQL($sql, $event, null, $params);  
        
        if (!empty($result)) {
            $result = $result[0];
        }
        
        return $result;        
        
    }      
    
    public function chechNo($event, $no, $id = 0){
        
        $conditions = "";
        $params = array(
            ":dnos" => $no
        );

        if (!empty($id) && is_numeric($id)) {
            $conditions .= "AND id != :id";
            $params[":id"] = $id;
        }        
        
        $sql = "SELECT bp.id,
                       bp.dnos,
                       bp.dnames,
                       bp.algorithm
                FROM base_product AS bp
                WHERE bp.dnos = :dnos ";
        
        $result = $this->query_SQL($sql, $event, null, $params);  
        
        if (!empty($result)) {
            $result = $result[0];
        }
        
        return $result;        
        
    }
    
    public function chechName($event, $name, $id = 0){
        
        $conditions = "";
        $params = array(
            ":dnames" => $name
        );

        if (!empty($id) && is_numeric($id)) {
            $conditions .= "AND id != :id";
            $params[":id"] = $id;
        }        
        
        $sql = "SELECT bp.id,
                       bp.dnos,
                       bp.dnames,
                       bp.algorithm
                FROM base_product AS bp
                WHERE bp.dnames = :dnames ";
        
        $result = $this->query_SQL($sql, $event, null, $params);  
        
        if (!empty($result)) {
            $result = $result[0];
        }
        
        return $result;        
        
    }    
    
    public function getAllProduct($event, $ispage, $condition, $params, $limit) {

        $sql = "SELECT " . ($ispage ? " sql_calc_found_rows " : "") . "
                      *
                FROM service AS bp 
                WHERE bp.seller_id = :sellerId
                      $condition
                ORDER BY bp.creatTime DESC";
        $result = $this->query_SQL($sql, $event, $limit, $params);

        return $result;        
    }
//企业服务分类
    public function getAllCategory($event, $ispage, $condition, $params, $limit) {

        $sql = "SELECT " . ($ispage ? " sql_calc_found_rows " : "") . "
                      *
                FROM business_service_category AS bp 
                WHERE bp.seller_id = :sellerId
                      $condition
                ORDER BY bp.creatTime";
        $result = $this->query_SQL($sql, $event, $limit, $params);

        return $result;
    }
//企业服务
    public function getAllService($event, $ispage, $condition, $params, $limit) {

        $sql = "SELECT " . ($ispage ? " sql_calc_found_rows " : "") . "
                      *
                FROM business_service AS bp 
                WHERE bp.seller_id = :sellerId
                      $condition
                ORDER BY bp.creatTime";
        $result = $this->query_SQL($sql, $event, $limit, $params);

        return $result;
    }
}
