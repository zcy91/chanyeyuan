<?php
namespace console\events\system;

use console\events\BaseEvent;

class SysEvent extends BaseEvent {
    public $Id;
    public $access_log_data;
    public $error_log_data;
    public $system_banner_data;
    public function  set_system_banner_id($seq_no){
        $this->Id = $seq_no;
    }
}

?>