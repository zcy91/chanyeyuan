<?php
namespace console\events\repair;

use console\events\BaseEvent;

class RepairEvent extends BaseEvent {

    public $repairId;
    public $repair_data;

    public function  set_repair_id($seq_no){
        $this->repairId = $seq_no;
    }

}

?>