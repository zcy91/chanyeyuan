<?php
/*
用户控制器
 *  */
namespace Home\Controller;
use Home\Model\ServiceModel;
use Home\Model\UserModel;
use Home\Model\RoleModel;
use Home\Plugin\Upfile;
class IndexController extends CommonController
{
    public function index(){
        if($_POST){

        }else
        return $this->display();
    }
}