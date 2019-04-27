<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/22
 * Time: 12:51
 */
//企业服务
namespace Home\Controller;
use Home\Model\BusinessServiceCategoryModel;
use Home\Model\BusinessServiceModel;
use Home\Plugin\Upfile;

class BusinessServiceController extends CommonController
{
    protected function _initialize(){
        parent::_initialize();
        //判断登录
        if (session('userId') == null){
            $this->ajaxReturn(array("status" => 0, "info" => "未登录"));
        }
    }
    /**
    分类列表
     **/
    public function category_list(){
        $p = isset($_POST['p'])?$_POST['p']:1;
        $pagesize = I("post.page_size");
        $post_data = I("post.");
        $search_str = [];
        if(!empty($post_data)){
            $search_type = $post_data['search_type'];
            switch($search_type){
                case 1: $search_str['name'] = $post_data['search_str']; break;  //名称
                case 2: $search_str['is_show'] = $post_data['search_str']; break;  //展示类型
            }
        }

        $category = new BusinessServiceCategoryModel();
        $params = array(
            "pagination" => array(
                "pagesize" => $pagesize,
                "pageindex" => $p,
                "recordcount" => 0
            )
        );
        if(isset($post_data['level']) && !empty($post_data['level'])){
            $params['level'] = $post_data['level'];
        }else{
            $params['level'] = 1;
        }
        if(isset($post_data['id']) && !empty($post_data['id'])) {
            $params['id'] = $post_data['id'];
            unset($params['level']);
        }
        if(isset($post_data['name']) && !empty($post_data['name'])){
            $params['name'] = $post_data['name'];
        }
        if(isset($post_data['is_show'])){
            $params['is_show'] = $post_data['is_show'];
        }
        if(isset($post_data['time_limit'])){
            $params['time_limit'] = $post_data['time_limit'];
        }
        $apiData = $category->fetchs($params);
        $returnData = array(
            "totalItem" => $apiData['returnData']['recordcount'],
            "time_limit" => $apiData['returnData']['time_limit'],
            "p" => $p,
            "items"      => $apiData['returnData']['data']
        );

        $info = get_error_info($apiData['returnState']);
        $this->ajaxReturn(array("status"=>$apiData['returnState'],"data"=>$returnData,"info"=>$info));
    }

    //添加编辑分类
    public function add_save_category(){
//                $memcache_obj = memcache_connect('192.168.0.135', 11211);
//        memcache_flush($memcache_obj);
        $post_data = $_POST;
        if (empty($post_data)) {
            $this->ajaxReturn(array("status" => 0, "info" => "参数异常"));
        }
        //处理图片上传
        if ($_FILES['file']['name']) {
            $file = new Upfile($_FILES['file']);
            $post_data['image'] = $file->get_url();
        }
        $post_data['uid'] = session('userId');
        //超级管理员
        if($post_data['uid'] == 100){
            $post_data['ownSellerId'] = $_POST['seller_id'];
        }
        $business_id = I("id", 0, intval);
        $Business_category = new BusinessServiceCategoryModel();
        if ($business_id == 0) {
            //var_dump($sellerInfo);
            $apiData = $Business_category->add($post_data);
        } else {
            $apiData = $Business_category->save($post_data);
        }

        $info = "";
        if ($apiData['returnState'] != 1) {
            $info = get_error_info($apiData['returnState']);
        } else {
            $id = $apiData['returnData']['base_service']['id'];
        }

        $this->ajaxReturn(array("status" => $apiData['returnState'], "info" => $info, "id" => $id), json);
    }
    //删除分类
    public function category_delete(){
        $post_data = I("post.");
        if(!isset($post_data['id']) || $post_data['id'] == "" ||  $post_data['id'] == 0){
            $this->ajaxReturn(array("status"=>0,"info"=>"参数异常"));
        }
        $category = new BusinessServiceCategoryModel();
        $apiData = $category->delete($post_data);
        $info = "";
        if($apiData['returnState'] != 1){
            $info = get_error_info($apiData['returnState']);
        }
        $this->ajaxReturn(array("status"=>$apiData['returnState'],"info"=>$info),json);
    }
    //增加修改企业信息
    public function add_save_business_service(){
        $post_data = $_POST;
        if (empty($post_data)) {
            $this->ajaxReturn(array("status" => 0, "info" => "参数异常"));
        }
        //处理图片上传
        if ($_FILES['file']['name']) {
            $file = new Upfile($_FILES['file']);
            $post_data['image'] = $file->get_url();
        }
        $post_data['uid'] = session('userId');
        //超级管理员
        if($post_data['uid'] == 100){
            $post_data['ownSellerId'] = $_POST['seller_id'];
        }
        $business_id = I("id", 0, intval);
        $Business= new BusinessServiceModel();
        if ($business_id == 0) {
            $apiData = $Business->add($post_data);
        } else {
            $apiData = $Business->save($post_data);
        }

        $info = "";
        if ($apiData['returnState'] != 1) {
            $info = get_error_info($apiData['returnState']);
        } else {
            $id = $apiData['returnData']['base_service']['id'];
        }

        $this->ajaxReturn(array("status" => $apiData['returnState'], "info" => $info, "id" => $id), json);
    }
    //展示
    public function business_service_list(){
        $p = isset($_POST['p'])?$_POST['p']:1;
        $pagesize = I("post.page_size");
        $post_data = I("post.");
        $search_str = [];
        if(!empty($post_data)){
            $search_type = $post_data['search_type'];
            switch($search_type){
                case 1: $search_str['name'] = $post_data['search_str']; break;  //名称
                case 2: $search_str['is_show'] = $post_data['search_str']; break;  //展示类型
                case 3: $search_str['cat_id'] = $post_data['search_str']; break;  //展示类型
            }
        }

        $BusinessServiceModel = new BusinessServiceModel();
        $params = array(
            "pagination" => array(
                "pagesize" => $pagesize,
                "pageindex" => $p,
                "recordcount" => 0
            )
        );
        if(isset($post_data['id']) && !empty($post_data['id'])) {
            $params['id'] = $post_data['id'];
        }
        if(isset($post_data['name']) && !empty($post_data['name'])){
            $params['name'] = $post_data['name'];
        }
        if(isset($post_data['is_show'])){
            $params['is_show'] = $post_data['is_show'];
        }
        if(isset($post_data['time_limit'])){
            $params['time_limit'] = $post_data['time_limit'];
        }
        if(isset($post_data['cat_id'])){
            $params['cat_id'] = $post_data['cat_id'];
        }
        $apiData = $BusinessServiceModel->fetchs($params);
        $returnData = array(
            "totalItem" => $apiData['returnData']['recordcount'],
            "time_limit" => $apiData['returnData']['time_limit'],
            "p" => $p,
            "items"      => $apiData['returnData']['data']
        );

        $info = get_error_info($apiData['returnState']);
        $this->ajaxReturn(array("status"=>$apiData['returnState'],"data"=>$returnData,"info"=>$info));
    }
    //删除
    public function business_service_delete(){
        $post_data = I("post.");
        if(!isset($post_data['id']) || $post_data['id'] == "" ||  $post_data['id'] == 0){
            $this->ajaxReturn(array("status"=>0,"info"=>"参数异常"));
        }
        $BusinessServiceModel = new BusinessServiceModel();
        $apiData = $BusinessServiceModel->delete($post_data);
        $info = "";
        if($apiData['returnState'] != 1){
            $info = get_error_info($apiData['returnState']);
        }
        $this->ajaxReturn(array("status"=>$apiData['returnState'],"info"=>$info),json);
    }

    //根据分类id查找下级
    public function get_category(){
        $post_data = I("post.");
        if(!isset($post_data['id']) || $post_data['id'] == "" ||  $post_data['id'] == 0){
            $this->ajaxReturn(array("status"=>0,"info"=>"参数异常"));
        }
        $data = M('business_service_category')->where(['id'=>$post_data['id']])->find();
        $seller_id = $data['seller_id'];
        $arr = M('business_service_category')->where(['parent_id'=>$data['id'],'seller_id'=>$seller_id,'is_show'=>1])->select();
       if(!empty($arr)){
           $this->ajaxReturn(array("status"=>1,"data"=>$arr,"info"=>'获取成功'));
       }else{
           $this->ajaxReturn(array("status"=>0,"data"=>[],"info"=>'无数据'));
       }
    }
    //获取1级类目
    public function get_one_category(){
        if($_SESSION['userId'] == 100){
            $seller_id = I('post.seller_id');
        }else{
            $site_url = $_SESSION['site_url'];
            $seller_id = M("user_shop")->where(['shop_url_self'=>$site_url])->field('seller_id')->find();
            $seller_id = $seller_id['seller_id'];
        }
        $catrgory = M('business_service_category')->where(['seller_id'=>$seller_id,"level"=>1,"is_show"=>1])->select();
        if(!empty($catrgory)){
            $this->ajaxReturn(array("status"=>1,"data"=>$catrgory,"info"=>'获取成功'));
        }else{
            $this->ajaxReturn(array("status"=>0,"data"=>[],"info"=>'无数据'));
        }
    }

}