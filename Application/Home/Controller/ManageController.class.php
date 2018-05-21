<?php

namespace Home\Controller;

class ManageController extends HomeController
{
    public function adsell()
    {
        $userid=session('userid');
		$coinArr = M('coin') -> where(array('status'=>1)) -> select();
        if (!$userid) {
            redirect(U('Login/phone'));
        }
        $coin=strtolower(I('get.type'));
        $coin=M('coin')->where(array('name'=>$coin))->getField('name');

        if (!$coin) {
            $coin='btc';
        }

        $where['coin']=$coin;
        $where['userid']=$userid;
        $where['ad_type']=0;
        $adsell=M('newad')->where($where)->select();
        $this->assign('coinArr',  $coinArr);
        $this->assign('coinname',  $coin);
        $this->assign('adsell', $adsell);
        $this->display();
    }

    public function adbuy()
    {
        $userid=session('userid');
		$coinArr = M('coin') -> where(array('status'=>1)) -> select();
        if (!$userid) {
            redirect(U('Login/phone'));
        }
        $coin=strtolower(I('get.type'));
        $coin=M('coin')->where(array('name'=>$coin))->getField('name');
        if (!$coin) {
            $coin='btc';
        }
        $where['coin']=$coin;
        $where['userid']=$userid;
        $where['ad_type']=1;
        $adbuy=M('newad')->where($where)->select();
        $this->assign('coinArr',  $coinArr);
        $this->assign('coinname', $coin);
        $this->assign('adbuy', $adbuy);
        $this->display();
    }


    /*修改上架或者下架广告*/
    public function showorhide()
    {
          $adid=I('post.adid');

          $userid=session('userid');

          $where['userid']=$userid;

          $where['id']=$adid;

          $adinfo=M('newad')->where($where)->find();

        if (!$adinfo) {
            $this->error('失败');
        }

        if ($adinfo['status']) {
            $re=M('newad')->where($where)->setField('status', '0');
        } else {
            $re=M('newad')->where($where)->setField('status', '1');
        }

        if ($re) {
            $this->success('成功');
        } else {
            $this->error('失败');
        }
    }

    //修改广告
    public function editad()
    {
        if (IS_POST) {
            $adid=I('post.adid/d');
            $userid=session('userid');
            $adinfo=M('newad')->where(array('id'=>$adid,'userid'=>$userid))->find();
            if ($adinfo) {
                $price=I('post.price');
                $trade_type=I('post.trade_type/s');

                if ($trade_type=='ONLINE_SELL') {
                    $trade_type=0;
                } elseif ($trade_type=='ONLINE_BUY') {
                    $trade_type=1;
                } else {
                    $this->error('错误');
                }


                if ($price=='' || $price<=0 || $price>999999999) {
                    $this->error('价格填写错误');
                }

                if (!preg_match("/^([1-9]\d*|0)(\.\d{1,2})?$/", $price)) {
                    $this->error('价格填写错误');
                }

                $min_amount=I('post.min_amount');
                if ($min_amount=='' || $min_amount<50) {
                    $this->error('最小限额不能低于50');
                }

                if (!preg_match("/^[1-9][0-9]*$/", $min_amount)) {
                    $this->error('最小限额不能为小数');
                }

                $max_amount=I('post.max_amount');
                if ($max_amount=='' || $max_amount >999999999) {
                    $this->error('最大限额错误');
                }

                if (!preg_match("/^[1-9][0-9]*$/", $max_amount)) {
                    $this->error('最大限额不能为小数');
                }

                if ($max_amount<$min_amount) {
                    $this->error('最大限额不能低于最小限额');
                }

                if ($trade_type) {
                    $paytime=I('post.paytime');
                    if ($paytime==''|| !is_numeric($paytime) || $paytime>60) {
                        $this->error('付款期限错误');
                    }
                }

                $provider=I('post.provider');
                if ($provider=='') {
                    $this->error('收款方式错误');
                }

                if ($provider=='national_bank') {
                    $provider=1;
                } elseif ($provider=='alipay') {
                    $provider=2;
                } elseif ($provider=='wechat_pay') {
                    $provider=3;
                } elseif ($provider=='other') {
                    $provider=4;
                } else {
                    $this->error('收款方式错误');
                }

                $message=I('post.message/s');
                if (!$message) {
                    $this->error('广告留言不能为空');
                }

                $coin=I('post.coin');
                if (!$coin) {
                    $this->error('错误');
                }

                $data['price']=$price;
                $data['min_amount']=$min_amount;
                $data['max_amount']=$max_amount;
                if ($trade_type) {
                    $data['paytime']=$paytime;
                }
                $data['provider']=$provider;
                $data['message']=$message;
                $re=M('newad')->where(array('id'=>$adid))->save($data);
                if ($re) {
                    $this->success('广告修改成功');
                } else {
                    $this->error('广告修改失败');
                }
            } else {
                $this->error('错误');
            }
        } else {
            $adid=I('get.adid');

            $userid=session('userid');

            $where['userid']=$userid;

            $where['id']=$adid;

            $adinfo=M('newad')->where($where)->find();

            if ($adinfo) {
                $this->assign('adinfo', $adinfo);
                $this->display();
            } else {
                $this->error('参数错误');
            }
        }
    }
}
