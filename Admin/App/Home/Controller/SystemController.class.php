<?php
/*
用户控制器
 *  */
namespace Home\Controller;
use Home\Model\ServiceModel;
use Home\Model\SystemModel;
use Home\Model\UserModel;
use Home\Model\RoleModel;
use Home\Plugin\Upfile;
class SystemController extends CommonController
{
    protected function _initialize(){
        parent::_initialize();
        //判断登录
        if (session('userId') == null){
            $this->ajaxReturn(array("status" => 0, "info" => "未登录"));
        }
    }

    public function add_banner(){
        if ($_FILES['banner']) {
            $file = new Upfile($_FILES['banner']);
            $data = $file->get_url();
        }
        if($data){
            $this->ajaxReturn(array("status" => 1, "info" => "成功",'data'=>$data));
        }else{
            $this->ajaxReturn(array("status" => 0, "info" => "失败",'data'=>[]));
        }
    }
    //添加，编辑banner
    public function add_save_banner(){
        $seller_id = session('seller_id');
        if(empty($seller_id)){
            $this->ajaxReturn(array("status" => 0, "info" => "登录异常"));
        }
        $post_data = $_POST;
        if (empty($post_data)) {
            $this->ajaxReturn(array("status" => 0, "info" => "参数异常"));
        }

        $uid = session('userId');
        //超级管理员
        if($uid == 100){
            $ownSellerId = $_POST['seller_id'];
            $seller_id = $ownSellerId;
        }else{
            $ownSellerId = '';
        }
        foreach ((array)$post_data as $k=>$v){
            $data[$k]['url'] = $v['url'];
            $data[$k]['title'] = $v['title'];
            $data[$k]['sort'] = $v['sort'];
            $data[$k]['uid'] = $uid;
            $data[$k]['banner'] = $v['banner'];
            if($ownSellerId){
                $data[$k]['ownSellerId'] = $_POST['seller_id'];
            }
        }
        if(!empty($data)){
            M('system_banner')->where(['seller_id'=>$seller_id])->delete();
        }
        $Service = new SystemModel();
            foreach ($data as $key=>$val) {
                $apiData = $Service->banneradd($val);
            }
        $info = "";
        if ($apiData['returnState'] != 1) {
            $info = get_error_info($apiData['returnState']);
        } else {
            $id = $apiData['returnData']['base_service']['id'];
        }
        $this->ajaxReturn(array("status" => $apiData['returnState'], "info" => $info, "id" => $id), json);
    }

    public function banner_list(){
        $seller_id = session('seller_id');
        if(empty($seller_id)){
            $this->ajaxReturn(array("status" => 0, "info" => "登录异常"));
        }
        $data = M('system_banner')->where(['seller_id'=>$seller_id])->order("sort DESC")->select();
        if($data){
            $this->ajaxReturn(array("status" => 1, "info" => "成功",'data'=>$data));
        }else{
            $this->ajaxReturn(array("status" => 0, "info" => "无数据",'data'=>[]));
        }
    }
}