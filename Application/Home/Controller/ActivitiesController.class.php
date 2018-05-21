<?php
namespace Home\Controller;

class ActivitiesController extends HomeController
{
    public function index()
    {
        if (session('userid')) {
            $yqm=M('user')->where(array('id'=>session('userid')))->getField('yqm');
            //直推人数
            $ztrs=M('user')->where(array('pid'=>session('userid')))->count();
            //直推btc数量
            $yqr_fee=M('config')->where(array('id'=>1))->getField('yqr_fee');
            $zs=M('orderlog')->where(array('userid'=>session('userid'),'order_type'=>3))->sum('num');
            $this->assign('zs',$zs);
            $this->assign('yqr_fee', $yqr_fee);
            $this->assign('ztrs', $ztrs);
            $this->assign('lianjie', 'http://'.$_SERVER['HTTP_HOST'].'/Signup/phone?ref='.$yqm);
            $this->display();
        } else {
            redirect(U('Login/phone'));
        }
    }
}
