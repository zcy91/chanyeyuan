<?php
namespace console\events\business_service;

use console\events\BaseEvent;

class BusinessServiceEvent extends BaseEvent {

    public $Id;
    public $business_service_data;

    public function  set_business_service_id($seq_no){
        $this->Id = $seq_no;
    }

}

?>