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
use Home\Plugin\Upfile;

class BusinessServiceController extends CommonController
{
    protected function _initialize(){
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
}