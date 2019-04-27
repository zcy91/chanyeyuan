<?php
namespace console\models\contract;


use console\models\BaseModel;
use console\models\user\View_UserLogin;
use console\models\base\View_BaseProduct;
use console\models\base\View_BaseProductAttr;
use console\models\base\View_BaseProductAttrItem;
use console\models\base\View_BaseProductCommission;

class List_BaseContract extends BaseModel {

    public function contractList($event){

        $data = &$event->RequestArgs;

        $ownSellerId = View_UserLogin::getOperateSellerId($data);
        if (empty($ownSellerId)) {
            return parent::go_error($event, -2011);
        }

        $now_time = date('Y-m-d H:i:s');
        $time_limit = isset($data["time_limit"]) && !empty($data["time_limit"]) ? $data["time_limit"] : $now_time;

        $limit_arr = $event->Pagination;//分页信息
        $limit = parent::getLimitArr($event);//获得分类信息数组或空值
        $ispage = isset($limit_arr["ispage"]) ? $limit_arr["ispage"] : 0;

        $condition = " AND bp.creatTime <= :time_limit AND bp.is_delete = 0";
        $params = array(
            ":sellerId" => $ownSellerId,
            ":time_limit" => $time_limit
        );
        if (isset($data["id"]) && !empty($data["id"])) {
            $condition .= " AND bp.id = :id";
            $params[":id"] = $data["id"];
        }

        if (isset($data["tenant"]) && !empty($data["tenant"])) {
            $condition .= " AND bp.tenant = :tenant";
            $params[":tenant"] = $data["tenant"];
        }
        $View_BaseProduct = new View_BaseContract();
        $dataAttr = $View_BaseProduct->getAllProduct($event, $ispage, $condition, $params, $limit);
        foreach ($dataAttr as $k=>$v){
            $contract_id = $v['id'];
            $res = $View_BaseProduct->get_cost($event,$contract_id);
            $dataAttr[$k]['cost'] = $res;
        }
        unset($View_BaseProduct);

        if (empty($dataAttr)) {
            $dataAttr = [];
        }

        if ($ispage) {

            $sql = " SELECT FOUND_ROWS() as record_count; ";
            $return_count = $this->query_SQL($sql, $event);
            $recode_count = $return_count[0]['record_count'];

            $return_data = array(
                "pagesize" => $limit_arr["pagesize"],
                "pageindex" => $limit_arr["pageindex"],
                "recordcount" => $recode_count,
                "time_limit" => $time_limit,
                "data" => &$dataAttr
            );
        } else {
            $return_data = &$dataAttr;
        }

        $event->Postback($return_data);
    }

}
