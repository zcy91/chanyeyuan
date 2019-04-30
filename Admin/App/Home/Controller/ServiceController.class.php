<?php
/*
用户控制器
 *  */
namespace Home\Controller;
use Home\Model\ServiceModel;
use Home\Model\UserModel;
use Home\Model\RoleModel;
use Home\Plugin\Upfile;
class ServiceController extends CommonController
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
    public function service_list(){

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

        $service = new ServiceModel();
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

        if(!empty($post_data['is_show']) && isset($post_data['is_show'])){
            $params['is_show'] = $post_data['is_show'];
        }
        if(isset($post_data['id']) && !empty($post_data['id'])){
            $params['id'] = $post_data['id'];
        }
        if(isset($post_data['time_limit']) && !empty($post_data['time_limit'])){
            $params['time_limit'] = $post_data['time_limit'];
        }

        $apiData = $service->fetchs($params);
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
        //处理图片上传
        if ($_FILES['icon']['name']) {
            $file = new Upfile($_FILES['icon']);
            $post_data['icon'] = $file->get_url();
        }
        $post_data['uid'] = session('userId');
        //超级管理员
        if($post_data['uid'] == 100){
            $post_data['ownSellerId'] = $_POST['seller_id'];
        }
        $service_id = I("id", 0, intval);
        $Service = new ServiceModel();
        if ($service_id == 0) {
           //var_dump($sellerInfo);
            $apiData = $Service->add($post_data);
        } else {
            $apiData = $Service->save($post_data);
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
            $data[$k]['banner'] = $v['banner'];
            $data[$k]['sort'] = $v['sort'];
            $data[$k]['title'] = $v['title'];
            $data[$k]['uid'] = $uid;
            if($ownSellerId){
                $data[$k]['ownSellerId'] = $_POST['seller_id'];
            }
        }

//        $service_id = I("id", 0, intval);
        $Service = new ServiceModel();
//        if ($service_id == 0) {
        if(!empty($data)){
            M('service_banner')->where(['seller_id'=>$seller_id])->delete();
        }
            foreach ($data as $key=>$val){

                $apiData = $Service->banneradd($val);
            }

//        } else {
//            $apiData = $Service->bannersave($post_data);
//        }

        $info = "";
        if ($apiData['returnState'] != 1) {
            $info = get_error_info($apiData['returnState']);
        } else {
            $id = $apiData['returnData']['base_service']['id'];
        }

        $this->ajaxReturn(array("status" => $apiData['returnState'], "info" => $info, "id" => $id), json);
    }
    function object2array($object) {
        if (is_object($object)) {
            foreach ($object as $key => $value) {
                $array[$key] = $value;
            }
        }
        else {
            $array = $object;
        }
        return $array;
    }
    public function banner_delete(){
        $post_data = I("post.");
        if(!isset($post_data['id']) || $post_data['id'] == "" ||  $post_data['id'] == 0){
            $this->ajaxReturn(array("status"=>0,"info"=>"参数异常"));
        }

        $Service = new ServiceModel();
        $apiData = $Service->bannerdelete($post_data);
        $info = "";
        if($apiData['returnState'] != 1){
            $info = get_error_info($apiData['returnState']);
        }
        $this->ajaxReturn(array("status"=>$apiData['returnState'],"info"=>$info),json);
    }
    public function banner_list(){
        $site_url = $_SESSION['site_url'];
        $seller_id = M('user_shop') ->where(['shop_url_self'=>$site_url])->field('seller_id')->find();
        $seller_id = $seller_id['seller_id'];
        $data = M('service_banner')->where(['seller_id'=>$seller_id])->order("sort DESC")->select();
        if($data){
            $this->ajaxReturn(array("status" => 1, "info" => "成功",'data'=>$data));
        }else{
            $this->ajaxReturn(array("status" => 0, "info" => "无数据",'data'=>[]));
        }
    }
}