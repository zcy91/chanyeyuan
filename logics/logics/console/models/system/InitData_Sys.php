<?php
namespace console\models\system;

use console\models\BaseModel;
use console\models\user\View_UserLogin;

class InitData_Sys extends BaseModel {
    private $Id;
    public function logAdd($event){
        
        $data = &$event->RequestArgs;
    
        if (empty($data)) {
            return parent::go_error($event, -12);
        }
        
        $event->access_log_data = array(
            "customer_id" => $data["seller_id"],
            "site_id" => $data["site_id"],
            "user_id" => $data["user_id"],
            "module_name" => $data["module_name"],
            "controller_name" => $data["controller_name"],
            "action_name" => $data["action_name"],
            "args" => $data["args"],
            "src_ip" => $data["src_ip"],
            "webserver_url" => $data["webserver_url"],
            "webserver_ip" => $data["webserver_ip"]            
        );
 
    }
    
    public function errAdd($event){
        
        $data = &$event->RequestArgs;
        
        if (empty($data)) {
            return parent::go_error($event, -12);
        }
     
        $event->error_log_data = array(
            "logger_id" => $data["logger_id"],
            "error_code" => $data["error_code"],
            "message" => $data["message"],
            "sys_trace" => $data["sys_trace"]        
        );        
    }

    public function bannerAdd($event){
        $data = &$event->RequestArgs;
        if (empty($data) || !isset($data["banner"]) ) {
            return parent::go_error($event, -12);
        }
        $ownSellerId = $this->Id = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }
        $nowTime = date('Y-m-d H:i:s');
        $event->system_banner_data = array(
            "banner" => $data["banner"],
            "url" => $data["url"],
            "seller_id" => $ownSellerId,
            "creatTime" => $nowTime,
            "uid" => $data['uid'],
            'title'=>$data['title'],
            'sort'=>$data['sort']
        );
//        var_dump($event->system_banner_data);
    }

}
