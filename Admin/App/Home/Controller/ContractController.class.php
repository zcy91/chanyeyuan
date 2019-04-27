<?php
/*
用户控制器
 *  */
namespace Home\Controller;
use Home\Model\BuildingModel;
use Home\Model\ContractModel;
use Home\Model\HousingModel;
use Home\Model\RepairModel;

use Home\Model\UserModel;
use Home\Model\RoleModel;
use Home\Plugin\Upfile;
class ContractController extends CommonController
{
    protected function _initialize(){
        parent::_initialize();
        //判断登录
        if (session('userId') == null){
            $this->ajaxReturn(array("status" => 0, "info" => "未登录"));
        }
    }
    /**
    列表
     **/
    public function contract_list(){
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

        $housing = new ContractModel();
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
        if(isset($post_data['name']) && !empty($post_data['tenant'])){
            $params['tenant'] = $post_data['tenant'];
        }
        if(isset($post_data['id']) && !empty($post_data['id'])){
            $params['id'] = $post_data['id'];
        }

        $apiData = $housing->fetchs($params);
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
//            p($_FILES['file']);die;
            $post_data['image'] = $file->get_url();
        }
        $id = I("id", 0, intval);
        $contract = new ContractModel();
        if ($id == 0) {
            $apiData = $contract->add($post_data);
        } else {
            $apiData = $contract->save($post_data);
        }

        $info = "";
        if ($apiData['returnState'] != 1) {
            $info = get_error_info($apiData['returnState']);
        } else {
            $id = $apiData['returnData']['contract']['id'];
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

        $Service = new ContractModel();
        $apiData = $Service->delete($post_data);
        $info = "";
        if($apiData['returnState'] != 1){
            $info = get_error_info($apiData['returnState']);
        }
        $this->ajaxReturn(array("status"=>$apiData['returnState'],"info"=>$info),json);
    }

    //获取房源
    public function get_housing(){
        $data = I('post.');
        $floor = $data['floor'];
        $building_id = $data['building_id'];
        if($_SESSION['userId'] == 100){
            $seller_id = I('post.seller_id');
        }else{
            $site_url = $_SESSION['site_url'];
            $seller_id = M("user_shop")->where(['shop_url_self'=>$site_url])->field('seller_id')->find();
            $seller_id = $seller_id['seller_id'];
        }

        $data = M('housing')->where(['building_id'=>$building_id,'floor'=>$floor,'is_delete'=>0,'seller_id'=>$seller_id,'investment_status'=>2,'is_use'=>0])->select();
        if(!empty($data)){
            $this->ajaxReturn(array("status"=>1,"data"=>$data,"info"=>'获取成功'));
        }else{
            $this->ajaxReturn(array("status"=>0,"data"=>[],"info"=>'无数据'));
        }
    }

    //获取楼宇
    public function get_building(){
        if($_SESSION['userId'] == 100){
            $seller_id = I('post.seller_id');
        }else{
            $site_url = $_SESSION['site_url'];
            $seller_id = M("user_shop")->where(['shop_url_self'=>$site_url])->field('seller_id')->find();
            $seller_id = $seller_id['seller_id'];
        }
        $data = M('building')->where(['is_delete'=>0,'seller_id'=>$seller_id])->select();
        if(!empty($data)){
            $this->ajaxReturn(array("status"=>1,"data"=>$data,"info"=>'获取成功'));
        }else{
            $this->ajaxReturn(array("status"=>0,"data"=>[],"info"=>'无数据'));
        }
    }
    //获取对用楼宇的层数
    public function get_floor(){
        $building_id = I('post.building_id');
        $floors = M('building')->where('id = '.$building_id)->field('starting_floor,end_floor')->find();
        $data = array(); // 待存入数组
        for ( $i =$floors['starting_floor']; $i <=
        $floors['end_floor']; $i ++ ) {
            $data[] = '第'.$i.'层'; // 逐个赋值
        }
        if(!empty($data)){
            $this->ajaxReturn(array("status"=>1,"data"=>$data,"info"=>'获取成功'));
        }else{
            $this->ajaxReturn(array("status"=>0,"data"=>[],"info"=>'无数据'));
        }
    }
    //费用记录修改
    public function cost_edit(){
        $data = I('post.');
        if(empty($data['cost_id'])){
            $this->ajaxReturn(array("status" => 0, "info" => "参数异常"));
        }
        $cost_id = $data['cost_id'];
        unset($data['cost_id']);
        $res = M('cost')->where(['cost_id'=>$cost_id])->save($data);
        if($res){
            $this->ajaxReturn(array("status"=>1,"data"=>[],"info"=>'成功'));
        }else{
            $this->ajaxReturn(array("status"=>0,"data"=>[],"info"=>'失败'));
        }
    }

    public function cost_delete(){
        $data = I('post.');
        if(empty($data['cost_id'])){
            $this->ajaxReturn(array("status" => 0, "info" => "参数异常"));
        }
        $cost_id = $data['cost_id'];
        unset($data['cost_id']);
        $res = M('cost')->where("cost_id = $cost_id")->save(['is_delete'=>1]);
        if($res){
            $this->ajaxReturn(array("status"=>1,"data"=>[],"info"=>'成功'));
        }else{
            $this->ajaxReturn(array("status"=>0,"data"=>[],"info"=>'失败'));
        }
    }

    public function cost_add(){
        $post_data = $_POST;
        if (empty($post_data ||empty($post_data['contract_id']) )) {
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
//            p($_FILES['file']);die;
            $post_data['image'] = $file->get_url();
        }
        $id = I("id", 0, intval);
        $contract = new ContractModel();
        if ($id == 0) {
            $apiData = $contract->add($post_data);
        } else {
//            $apiData = $contract->save($post_data);
        }

        $info = "";
        if ($apiData['returnState'] != 1) {
            $info = get_error_info($apiData['returnState']);
        } else {
            $id = $apiData['returnData']['contract']['id'];
        }

        $this->ajaxReturn(array("status" => $apiData['returnState'], "info" => $info, "id" => $id), json);
    }

}