<?php
namespace console\events\building;

use console\events\BaseEvent;

class BuildingEvent extends BaseEvent {

    public $Id;
    public $building_data;

    public function  set_building_id($seq_no){
        $this->Id = $seq_no;
    }

}

?>