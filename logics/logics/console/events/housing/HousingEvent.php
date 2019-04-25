<?php
namespace console\events\housing;

use console\events\BaseEvent;

class HousingEvent extends BaseEvent {

    public $Id;
    public $housing_data;

    public function  set_housing_id($seq_no){
        $this->Id = $seq_no;
    }

}

?>