<?php
namespace console\events\customer;

use console\events\BaseEvent;

class CustomerEvent extends BaseEvent {

    public $Id;
    public $customer_data;

    public function  set_customer_id($seq_no){
        $this->Id = $seq_no;
    }

}

?>