<?php


namespace Home\Controller;

use Think\Controller;

class HomeController extends Controller
{
    public function _initialize()
    {
        $sessioninfo = array(
            'userid' => session('userid'),
            'username' => session('username'),
        );

        $moneyinfo=M('user_coin')->where(array('userid'=>session('userid')))->find();
        $this->assign('moneyinfo',$moneyinfo);
        $this->assign('sessioninfo', $sessioninfo);
    }
}
