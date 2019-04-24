<?php
/*
用户控制器
 *  */
namespace Home\Controller;
use Home\Model\RepairModel;
use Home\Model\ServiceModel;
use Home\Model\UserModel;
use Home\Model\RoleModel;
use Home\Plugin\Upfile;
class RepairController extends CommonController
{
    protected function _initialize(){
        //判断登录
        if (session('userId') == null){
            $this->ajaxReturn(array("status" => 0, "info" => "未登录"));
        }
    }
    /**
    列表
     **/
    public function repair_list(){
        $p = isset($_POST['p'])?$_POST['p']:1;
        $pagesize = I("post.page_size");
        $post_data = I("post.");
        $search_str = [];
        if(!empty($post_data)){
            $search_type = $post_data['search_type'];
            switch($search_type){
                case 1: $search_str['service_name'] = $post_data['search_str']; break;  //名称
                case 2: $search_str['is_show'] = $post_data['search_str']; break;  //展示类型
            }
        }

        $repair = new RepairModel();
        $params = array(
            "pagination" => array(
                "pagesize" => $pagesize,
                "pageindex" => $p,
                "recordcount" => 0
            )
        );

        if(isset($post_data['contacts']) && !empty($post_data['contacts'])){
            $params['contacts'] = $post_data['contacts'];
        }
        if(isset($post_data['phone']) && !empty($post_data['phone'])){
            $params['phone'] = $post_data['phone'];
        }
        if(isset($post_data['handler']) && !empty($post_data['handler'])){
            $params['handler'] = $post_data['handler'];
        }
        if(isset($post_data['status']) && !empty($post_data['status'])){
            $params['status'] = $post_data['status'];
        }
        if(isset($post_data['id']) && !empty($post_data['id'])){
            $params['id'] = $post_data['id'];
        }

        $apiData = $repair->fetchs($params);
        $returnData = array(
            "totalItem" => $apiData['returnData']['recordcount'],
            "time_limit" => $apiData['returnData']['time_limit'],
            "p" => $p,
            "items"      => $apiData['returnData']['data']
        );

        $info = get_error_info($apiData['returnState']);
        $this->ajaxReturn(array("status"=>$apiData['returnState'],"data"=>$returnData,"info"=>$info));
    }

    //添加、编辑
    public function add_save()
    {
        $post_data = $_POST;
        if (empty($post_data)) {
            $this->ajaxReturn(array("status" => 0, "info" => "参数异常"));
        }
        $post_data['uid'] = session('userId');
        //超级管理员
        if($post_data['uid'] == 100){
            if(empty($_POST['seller_id'])){
                $this->ajaxReturn(array("status" => 0, "info" => "请选择产业园ID"));
            }
            $post_data['ownSellerId'] = $_POST['seller_id'];
        }
        $id = I("id", 0, intval);
        $repair = new RepairModel();
        if ($id == 0) {
            $apiData = $repair->add($post_data);
        } else {
            $apiData = $repair->save($post_data);
        }

        $info = "";
        if ($apiData['returnState'] != 1) {
            $info = get_error_info($apiData['returnState']);
        } else {
            $id = $apiData['returnData']['base_service']['id'];
        }

        $this->ajaxReturn(array("status" => $apiData['returnState'], "info" => $info, "id" => $id), json);
    }
    //查询单个
    public function single_view(){
        $service_id = I("post.id",1,intval);
        if($service_id == 0){
            $this->ajaxReturn(array("status"=>0,"info"=>"参数异常"));
        }

        $Service = new ServiceModel();
        $apiData = $Service->single_view(["id"=>$service_id]);
        $response_data = [];$info = "";
        if($apiData['returnState'] == 1 && !empty($apiData['returnData'])){
            $response_data = $apiData['returnData'];
        }else{
            $info = get_error_info($apiData['returnState']);
        }
        $this->ajaxReturn(array("status"=>1,"data"=>$response_data,"info"=>$info),json);
    }

    /**
    删除
     **/
    public function delete(){
        $post_data = I("post.");
        if(!isset($post_data['id']) || $post_data['id'] == "" ||  $post_data['id'] == 0){
            $this->ajaxReturn(array("status"=>0,"info"=>"参数异常"));
        }

        $Service = new ServiceModel();
        $apiData = $Service->delete($post_data);
        $info = "";
        if($apiData['returnState'] != 1){
            $info = get_error_info($apiData['returnState']);
        }
        $this->ajaxReturn(array("status"=>$apiData['returnState'],"info"=>$info),json);
    }

    //获取报修类型
    public function get_repair_type(){
        $data = M('repair_type')->select();
        if(!empty($data)){
            $this->ajaxReturn(array("status"=>1,"data"=>$data,"info"=>'获取成功'));
        }else{
            $this->ajaxReturn(array("status"=>0,"data"=>[],"info"=>'无数据'));
        }
    }

    //获取来源类型
    public function get_source(){
        $data = M('repair_source')->select();
        if(!empty($data)){
            $this->ajaxReturn(array("status"=>1,"data"=>$data,"info"=>'获取成功'));
        }else{
            $this->ajaxReturn(array("status"=>0,"data"=>[],"info"=>'无数据'));
        }
    }

    //获取紧急程度
    public function get_urgency(){
        $data = M('repair_urgency')->select();
        if(!empty($data)){
            $this->ajaxReturn(array("status"=>1,"data"=>$data,"info"=>'获取成功'));
        }else{
            $this->ajaxReturn(array("status"=>0,"data"=>[],"info"=>'无数据'));
        }
    }

    //处理状态
    public function get_status(){
        $data = M('handle_status')->select();
        if(!empty($data)){
            $this->ajaxReturn(array("status"=>1,"data"=>$data,"info"=>'获取成功'));
        }else{
            $this->ajaxReturn(array("status"=>0,"data"=>[],"info"=>'无数据'));
        }
    }
}