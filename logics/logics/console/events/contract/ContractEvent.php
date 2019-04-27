<?php
namespace console\events\contract;

use console\events\BaseEvent;

class ContractEvent extends BaseEvent {

    public $Id;
    public $contract_data;
    public $cost_data;

    public function  set_contract_id($seq_no){
        $this->Id = $seq_no;
    }

}

?>