<?php
namespace console\controllers\user;

use console\behaviors\user\UserBehavior;
use console\events\user\UserEvent;
use console\controllers\BaseController;
use console\behaviors\BaseBehavior;
use console\models\user\List_User;

class UserController extends BaseController {

    public function init() {
        parent::init();
        //给方法添加行为
        $this->behavior = new UserBehavior();
        $this->attachBehavior("Userbehavior", $this->behavior);
        //整理Web服务器传入的参数
        $this->event = new UserEvent();
    }
    public function actions()
    {
        return [
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => null,
                //背景颜色
                'backColor' => 0x000000,
                //最大显示个数
                'maxLength' => 4,
                //最少显示个数
                'minLength' => 4,
                //间距
                'padding' => 2,
                //高度
                'height' => 30,
                //宽度
                'width' => 85,
                //字体颜色
                'foreColor' => 0xffffff,
                //设置字符偏移量
                'offset' => 4,
            ],
        ];
    }
    public function actionCode(){
        if (\Yii::$app->request->isPost) {
            //获取post过来的验证码
            $verify = \Yii::$app->request->post('verify');

            //我们手动进行验证，第二个参数表示是否区分大小写
            if ($this->createAction('captcha')->validate($verify, false)) {
                echo '成功';
            } else {
                echo '失败';
            }

        } else {
            return 11;
        }
    }
    public function actionLogin($data) {
        //整理传入的数据
        $this->event->set($data, BaseBehavior::FETCH_ALL_ACTION);
        parent::fetch_all($this->getModels_Login(), $this->event);
        $this->event->Display();
        return 0;
    }  
    
    public function actionFetchusernode($data) {
        //整理传入的数据
        $this->event->set($data, BaseBehavior::FETCH_ALL_ACTION);
        parent::fetch_all($this->getModels_GetUserNode(), $this->event);
        $this->event->Display();
        return 0;
    }
    
    public function actionStaffadd($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::add($this->getModels_StaffAdd(), $this->event);
        $this->event->Display();
        return 0;
    }

    public function actionStaffedit($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::modify($this->getModels_StaffEdit(), $this->event);
        $this->event->Display();
        return 0;
    }   
    
    public function actionStaffenable($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::modify($this->getModels_StaffEnable(), $this->event);
        $this->event->Display();
        return 0;
    }  

    public function actionStaffsetsection($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::modify($this->getModels_StaffSetSection(), $this->event);
        $this->event->Display();
        return 0;
    } 

    public function actionStaffsetpost($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::modify($this->getModels_StaffSetPost(), $this->event);
        $this->event->Display();
        return 0;
    }      
    
    public function actionStafflist($data) {
        //整理传入的数据
        $this->event->set($data, BaseBehavior::FETCH_ALL_ACTION);
        parent::fetch_all($this->getModels_StaffList(), $this->event);
        $this->event->Display();
        return 0;
    }  

    public function actionStaffdesced($data) {
        //整理传入的数据
        $this->event->set($data, BaseBehavior::FETCH_ALL_ACTION);
        parent::fetch_all($this->getModels_StaffDescEd(), $this->event);
        $this->event->Display();
        return 0;
    }     
    
    public function actionStaffdesc($data) {
        //整理传入的数据
        $this->event->set($data, BaseBehavior::FETCH_ALL_ACTION);
        parent::fetch_all($this->getModels_StaffDesc(), $this->event);
        $this->event->Display();
        return 0;
    } 
    
    public function actionBindaccount($data) {
        $this->event->set($data, BaseBehavior::ADD_ACTION);
        parent::modify($this->getModels_BindAccount(), $this->event);
        if (!$this->event->error_code && $this->event->bindAccount) {
            $List_User = new List_User();
            $List_User->userLogin($this->event);
            unset($List_User);
        }
        $this->event->Display();
        return 0;
    }  
   
    public function actionRolestafflist($data) {
        //整理传入的数据
        $this->event->set($data, BaseBehavior::FETCH_ALL_ACTION);
        parent::fetch_all($this->getModels_RoleStaffList(), $this->event);
        $this->event->Display();
        return 0;
    }   
    
    public function actionGetallnode($data) {
        //整理传入的数据
        $this->event->set($data, BaseBehavior::FETCH_ALL_ACTION);
        parent::fetch_all($this->getModels_GetAllNode(), $this->event);
        $this->event->Display();
        return 0;
    }
   
}
