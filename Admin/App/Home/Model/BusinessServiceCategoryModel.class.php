<?php
namespace Home\Model;
use Home\Model\BaseModel;
// 描述：用于公共服务管理下的操作
class BusinessServiceCategoryModel extends BaseModel{

    private $Module = "businessservicecategory";
    private $Controller = "businessservicecategory";

    private $fetchs_router = "businessservicecategorylist";
    private $add_router = "businessservicecategoryadd";
    private $add_banner = "businessservicecategorybanneradd";
    private $save_router = "businessservicecategoryedit";
    private $delete_router = "businessservicecategorydelete";
    private $delete_banner = "businessservicecategorybannerdelete";
    private $setvisible_router = "servicedisplay";
    private $singleview_router = "servicedesc";

    //列表
    public function fetchs($params) {
        $apiData = c_call_service($this->Module, $this->Controller, $this->fetchs_router,$params);
        return $apiData;
    }

    //列表
    public function single_view($params) {
        $apiData = c_call_service($this->Module, $this->Controller, $this->singleview_router,$params);
        return $apiData;
    }

    /*
    添加
    **/
    public function add($params) {
        $apiData = c_call_service($this->Module, $this->Controller, $this->add_router,$params);
        return $apiData;
    }
    public function banneradd($params) {
        $apiData = c_call_service($this->Module, $this->Controller, $this->add_banner,$params);
        return $apiData;
    }

    /*
    修改
     *      */
    public function save($params) {
        $apiData = c_call_service($this->Module, $this->Controller, $this->save_router,$params);
        return $apiData;
    }

    //删除
    public function delete($params) {
        $apiData = c_call_service($this->Module, $this->Controller, $this->delete_router,$params);
        return $apiData;
    }
    public function bannerdelete($params) {
        $apiData = c_call_service($this->Module, $this->Controller, $this->delete_banner,$params);
        return $apiData;
    }

    //设置上下架
    public function set_visible($params) {
        $apiData = c_call_service($this->Module, $this->Controller, $this->setvisible_router,$params);
        return $apiData;
    }

}
