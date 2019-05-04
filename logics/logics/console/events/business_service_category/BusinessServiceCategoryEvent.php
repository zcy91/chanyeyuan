<?php
namespace console\events\business_service_category;

use console\events\BaseEvent;

class BusinessServiceCategoryEvent extends BaseEvent {

    public $categoryId;

    public $business_service_category_data;
    public $business_service_category_banner_data;

    public function  set_category_id($seq_no){
        $this->categoryId = $seq_no;
    }

}

?>