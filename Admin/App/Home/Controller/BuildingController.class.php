<?php
/*
用户控制器
 *  */
namespace Home\Controller;
use Home\Model\BuildingModel;
use Home\Model\RepairModel;

use Home\Model\UserModel;
use Home\Model\RoleModel;
use Home\Plugin\Upfile;
class BuildingController extends CommonController
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
    public function building_list(){
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

        $building = new BuildingModel();
        $params = array(
            "pagination" => array(
                "pagesize" => $pagesize,
                "pageindex" => $p,
                "recordcount" => 0
            )
        );


        if(isset($post_data['name']) && !empty($post_data['name'])){
            $params['name'] = $post_data['name'];
        }
        if(isset($post_data['id']) && !empty($post_data['id'])){
            $params['id'] = $post_data['id'];
        }

        $apiData = $building->fetchs($params);
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
        //处理图片上传
        if ($_FILES['file']['name']) {
            $file = new Upfile($_FILES['file']);
            $post_data['image'] = $file->get_url();
        }
        $id = I("id", 0, intval);
        $building = new BuildingModel();
        if ($id == 0) {
            $apiData = $building->add($post_data);
        } else {
            $apiData = $building->save($post_data);
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

        $Service = new BuildingModel();
        $apiData = $Service->delete($post_data);
        $info = "";
        if($apiData['returnState'] != 1){
            $info = get_error_info($apiData['returnState']);
        }
        $this->ajaxReturn(array("status"=>$apiData['returnState'],"info"=>$info),json);
    }

    //获取用途类型
    public function get_use(){
        $data = M('building_use')->select();
        if(!empty($data)){
            $this->ajaxReturn(array("status"=>1,"data"=>$data,"info"=>'获取成功'));
        }else{
            $this->ajaxReturn(array("status"=>0,"data"=>[],"info"=>'无数据'));
        }
    }


}