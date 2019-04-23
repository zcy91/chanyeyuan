<?php
namespace console\events\business_service;

use console\events\BaseEvent;

class BusinessServiceEvent extends BaseEvent {

    public $Id;

    public $business_service_data;
//    public $base_product_attr_data;
//    public $base_product_attr_item_data;
//    public $base_product_operate_data;
//    public $base_product_commission_quot_data;
//    public $base_product_commission_percentage_data;
//
//
//    public $base_product_attr_del;
//    public $base_product_attr_item_del;
//    public $base_product_commission_quot_del;
//    public $base_product_commission_percentage_del;

    public function  set_business_service_id($seq_no){
        $this->Id = $seq_no;
    }

}

?>