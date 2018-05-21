<?php

namespace Home\Controller;

class NewadController extends HomeController
{
    public function index()
    {
        if (IS_POST) {
            $userid=session('userid');
            $trade_type=I('post.trade_type/s');
            if ($trade_type=='ONLINE_SELL') {
                $trade_type=0;
            } elseif ($trade_type=='ONLINE_BUY') {
                $trade_type=1;
            } else {
                $this->error('错误');
            }

            $country=I('post.country/s');
            if ($country!='cn') {
                $this->error('错误');
            }

            $currency=I('post.currency/s');
            if ($currency!='cny') {
                $this->error('错误');
            }

            $price=I('post.price');


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

            $coininfo=M('coin')->where(array('name'=>$coin))->find();
            if (!$coininfo) {
                $this->error('错误');
            }

            $data['userid']=$userid;
            $data['ad_type']=$trade_type;
            $data['country']=$country;
            $data['currency']=$currency;
            $data['price']=$price;
            $data['min_amount']=$min_amount;
            $data['max_amount']=$max_amount;
            if ($trade_type) {
                $data['paytime']=$paytime;
            }
            $data['provider']=$provider;
            $data['message']=$message;
            $data['status']=1;
            $data['coin']=strtolower($coin);
            $data['addtime']=time();
            $re=M('newad')->add($data);
            if ($re) {
                $this->success('广告发布成功');
            } else {
                $this->error('广告发布失败');
            }
        } else {
            if (!session('userid')) {
                redirect(U('Login/phone'));
            }
			$data = array();														//	准备数据返回
			$coinArr = M('coin') -> where(array('status'=>1)) -> select();
			$data['coinArr'] = $coinArr;
			$this -> assign($data);
            $this->display();
        }
    }
}
