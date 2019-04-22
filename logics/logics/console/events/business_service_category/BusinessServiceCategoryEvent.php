<?php
namespace console\events\business_service_category;

use console\events\BaseEvent;

class BusinessServiceCategoryEvent extends BaseEvent {

    public $categoryId;

    public $business_service_category_data;
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

    public function  set_category_id($seq_no){
        $this->categoryId = $seq_no;
    }

}

?>