<?php
namespace Home\Controller;

class OrderController extends HomeController
{
    public function index()
    {
        if (IS_AJAX) {
            $adid=I('post.adid');
            $price=I('post.price');
            $amount=I('post.amount');
            $qty=I('post.qty');
            $ad_type=I('post.ad_type');
            $userid=session('userid');
            if (empty($userid)) {
                $this->error('请先登录');
            }

            if (abs($price*$qty-$amount)>0.01) {
                $this->error('价格错误');
            }

            $adinfo=M('newad')->where(array('id'=>$adid))->find();

            if (!$adinfo) {
                $this->error('广告参数错误');
            }

            if ($price!=$adinfo['price']) {
                $this->error('卖家已更改价格,请刷新后再试');
            }

            if ($price <= 0) {
                $this->error('价格不能为零');
            }

            if ($amount <=0) {
                $this->error('购买金额不能为负数');
            }

            if ($qty <= 0) {
                $this->error('购买数量不能为负数');
            }

            if ($amount<$adinfo['min_amount'] || $amount>$adinfo['max_amount']) {
                $this->error("请在交易限额范围内下单，交易限额: {$adinfo['min_amount']}-{$adinfo['max_amount']} {$adinfo['currency']}");
            }

            /*判断客户是否恶意购买*/
            $lastorder=M('order')->where(array('buyid'=>$userid))->order('addtime Desc')->find();

            $myCoin=M('user_coin')->where(array('userid'=>$userid))->find();

            if ($lastorder['status']==6) {
                if ($myCoin[$adinfo['coin']]<0.01) {
                    $this->error("由于你超时未打款,您必须{$adinfo['coin']}必须大于0.01才能继续交易");
                }
            }

            if ($ad_type) {
                /*客户出售btc*/
                $userCoin=M('user_coin')->where(array('userid'=>$userid))->find();

                $sellCoin=M('user_coin')->where(array('userid'=>$adinfo['userid']))->find();

                /*if ($sellCoin['btc']<0.05) {
                    $this->error('卖家余额不足0.05BTC,不可交易');
                }*/

                if ($userCoin[$adinfo['coin']]<$qty) {
                    $this->error("你的{$adinfo['coin']}数量不足,不可交易");
                }
                $config=M('config')->find();

                $fee=$qty*($config['order_fee']/100);

               /* if ($sellCoin['btc']<$fee) {
                       $this->error('卖家余额不足(手续费不足),可以联系对方');
                }*/

                M()->startTrans();
                /*冻结btc*/
                $re[]=M('user_coin')->where(array('userid'=>$userid))->setDec($adinfo['coin'], $qty);
                $re[]=M('user_coin')->where(array('userid'=>$userid))->setInc($adinfo['coin'].'d', $qty);

                /*下订单*/
                $data['buyid']=$adinfo['userid'];
                $data['sellid']=$userid;
                $data['coin']=$adinfo['coin'];
                $data['price']=$price;
                $data['num']=$qty;
                $data['fee']=$fee;
                $data['fkfs']=$adinfo['provider'];
                $data['amount']=$amount;
                $data['mum']=$price*$qty;
                $data['type']='1';
                if ($adinfo['paytime']) {
                    $data['delaytime']=$adinfo['paytime'];
                } else {
                    $data['delaytime']=30;
                }
                $data['addtime']=time();
                $data['status']=0;
                $res=M('order')->add($data);
                if (check_arr($re) && $res) {
                    M()->commit();
                    $phone=M('user')->where(array('id'=>$adinfo['userid']))->getField('mobile');
                    // 71522   聚合短信API模板ID
                    sendSMS($phone, '【九鼎】 尊敬的客户，您账户有新的交易，请登录网站确认！',71522);
                    $this->success('订单成功', U('Order/detail', array('id'=>$res)));
                } else {
                    M()->rollback();
                    $this->error('订单生成错误,请重新下单');
                }
            } else {
                /*客户购买btc*/
                $userCoin=M('user_coin')->where(array('userid'=>$adinfo['userid']))->find();

                /*if ($userCoin['btc']<0.05) {
                    $this->error('卖家余额不足0.05BTC,不可交易');
                }*/

                if ($userCoin[$adinfo['coin']]<$qty) {
                    $this->error('卖家余额不足');
                }
                $config=M('config')->find();

                $fee=$qty*($config['order_fee']/100);

                if ($userCoin[$adinfo['coin']]<$qty+$fee) {
                    $this->error('卖家余额不足(手续费不足)');
                }
                M()->startTrans();
                /*冻结btc*/
                $re[]=M('user_coin')->where(array('userid'=>$adinfo['userid']))->setDec($adinfo['coin'], $qty+$fee);
                $re[]=M('user_coin')->where(array('userid'=>$adinfo['userid']))->setInc($adinfo['coin'].'d', $qty+$fee);
                /*下订单*/
                $data['buyid']=$userid;
                $data['sellid']=$adinfo['userid'];
                $data['coin']=$adinfo['coin'];
                $data['price']=$price;
                $data['num']=$qty;
                $data['fee']=$fee;
                $data['fkfs']=$adinfo['provider'];
                $data['amount']=$amount;
                $data['mum']=$price*$qty;
                $data['type']='0';
                if ($adinfo['paytime']) {
                    $data['delaytime']=$adinfo['paytime'];
                } else {
                    $data['delaytime']=30;
                }
                $data['addtime']=time();
                $data['endtime']=0;
                $data['status']=0;
                $res=M('order')->add($data);
                //【九鼎】
                if (check_arr($re) && $res) {
                    M()->commit();
                    $phone=M('user')->where(array('id'=>$adinfo['userid']))->getField('mobile');
                    // 71522   聚合短信API模板ID
                    sendSMS($phone, '【九鼎】 尊敬的客户，您账户有新的交易，请登录网站确认！',71522);
                    $this->success('订单成功', U('Order/detail', array('id'=>$res)));
                } else {
                    M()->rollback();
                    $this->error('订单生成错误,请重新下单');
                }
            }
        } else {
            redirect(U('Index/index'));
        }
    }

    /*订单列表*/
    public function lists()
    {
        if (session('userid')) {
            $type = I('get.type');
            if ($type == 'going' || $type == '') {
                $where['_string'] = "(`status` NOT IN ('3','4','6') and buyid=" . session('userid') . ") or (`status` NOT IN ('3','4','6') and sellid=" . session('userid') . ")";
            } elseif ($type == 'ending') {
                $where['_string'] = "(`status` IN ('3','4','6') and buyid=" . session('userid') . ") or (`status` IN ('3','4','6') and sellid=" . session('userid') . ")";
            }

            $count = M('order')->where($where)->count();

            $Page = new \Think\Page($count, 10);

            $Page->setConfig('theme', '%first% %upPage% %linkPage% %downPage% %end% ');
            $show = $Page->show();

            $list = M('order')->where($where)->order('addtime Desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();
            foreach ($list as $k => $v) {
                if ($v['sellid'] == session('userid')) {
                    /*获取交易伙伴的信息*/
                    $jyhb = M('user')->where(array('id' => $v['buyid']))->find();
                } else {
                    $jyhb = M('user')->where(array('id' => $v['sellid']))->find();
                }

                $list[$k]['yjhb'] = $jyhb['id'];
                $list[$k]['ue_img'] = $jyhb['ue_img'];
                $list[$k]['username'] = $jyhb['username'];
            }
            $this->assign('list', $list);
            $this->assign('page', $show);
            $this->display();
        } else {
            redirect(U('Index/index'));
        }
    }


    /*订单详情*/
    public function detail()
    {
        $id=I('get.id');
		/**************************************************
		
		*	消
		*	息
		*	控
		*	制
		
		**************************************************/
        $userid=session('userid');
        if (!is_numeric($id)) {
            redirect(U('Index/index'));
        }
        $orderinfo=M('order')->where(array('id'=>$id))->find();
		
		if(isset($_SESSION['target'][$orderinfo['sellid']])){
			unset($_SESSION['target'][$orderinfo['sellid']]);											//	销毁对应保存
			$tid = $orderinfo['sellid'];
		}else{
			unset($_SESSION['target'][$orderinfo['buyid']]);											//	销毁对应保存
			$tid = $orderinfo['buyid'];
		}
		if($_SESSION['target'] == null){
			unset($_SESSION['target']);
		}
        if (!($orderinfo['buyid']==$userid || $orderinfo['sellid']==$userid)) {
            redirect(U('Index/index'));
        }
        /*获取用户名*/
        if (session('userid')==$orderinfo['sellid']) {
            $name=M('user')->where(array('id'=>$orderinfo['buyid']))->find();
        } else {
            $name=M('user')->where(array('id'=>$orderinfo['sellid']))->find();
        }
        /*订单状态*/
        switch ($orderinfo['status']) {
            case 0:
                $activetime = ceil(($orderinfo['addtime']+$orderinfo['delaytime']*60-time())/60);
                $buy_stage_text='已拍下';
                $buy_status_decs='订单将在托管中保存<span class="blue-text expiration">'.$activetime.'</span>分钟, 逾期未付款将自动取消';
                $sell_stage_text='已拍下';
                $sell_status_decs='订单将在托管中保存<span class="blue-text expiration">'.$activetime.'</span>分钟, 逾期未付款将自动取消';
                $buy_button='<a id="btnPay" class="btn" >标记已付款完成</a>
                         <a id="khCancel" class="btn second">取消交易</a>
                         <a id="btnshensu" class="btn" style="background: #31b0d5">申诉</a>';
                $sell_button='<a id="release" class="btn" >释放'.strtoupper($orderinfo['coin']).'</a>
                              <a id="btnshensu" class="btn" style="background: #31b0d5">申诉</a>';
                break;
            case 1:
                $buy_stage_text='已付款';
                $buy_status_decs='等待卖家确认收款后释放'.strtoupper($orderinfo['coin']);
                $sell_stage_text='已付款';
                $sell_status_decs='等待卖家确认收款后释放'.strtoupper($orderinfo['coin']);
                $buy_button='<a id="btnPayStage" class="btn disable">已标记付款</a>
                         <a id="khCancel" class="btn second">取消交易</a>
                         <a id="btnshensu" class="btn" style="background: #31b0d5">申诉</a>';
                $sell_button='<a id="release" class="btn" >释放'.strtoupper($orderinfo['coin']).'</a>
                              <a id="btnshensu" class="btn" style="background: #31b0d5">申诉</a>';
                break;
            case 2:
                /*查询评价*/
                $buyeva=M("evaluation")->where(array('userid'=>$orderinfo['buyid'],'orderid'=>$orderinfo['id']))->find();
                $selleva=M("evaluation")->where(array('userid'=>$orderinfo['sellid'],'orderid'=>$orderinfo['id']))->find();
                if ($buyeva) {
                    $sell_stage_text='已评论';
                    $sell_status_decs='您已评论。';
                    $buy_stage_text='已释放';
                    $buy_status_decs='请对交易做出评价。';
                    $sell_button='';
                    $buy_button='<div class="comment" style="color: #0a0a0a">对用户<strong>'.$name['username'].'</strong>留下评论?</div><div class="radio-cont"><div class="fl"><input type="radio" checked name="feedback" value="POSITIVE" id="POSITIVE"><label for="POSITIVE">好评</label></div>
                                  <div class="fm"><input type="radio" name="feedback" value="NEUTRAL" id="NEUTRAL"><label for="NEUTRAL">中评</label></div>
                                  <div class="fr"><input type="radio" name="feedback" value="NEGATIVE" id="NEGATIVE"><label for="NEGATIVE">差评</label></div>
                                  </div><a class="btn" id="btnComment">提交评论</a>';
                } elseif ($selleva) {
                    $sell_stage_text='已收货';
                    $sell_status_decs='请对交易做出评价。';
                    $buy_stage_text='已评论';
                    $buy_status_decs='您已评论。';
                    $sell_button='<div class="comment" style="color: #0a0a0a">对用户<strong>'.$name['username'].'</strong>留下评论?</div>
                                  <div class="radio-cont">
                                  <div class="fl"><input type="radio" checked name="feedback" value="POSITIVE" id="POSITIVE"><label for="POSITIVE">好评</label></div>
                                  <div class="fm"><input type="radio" name="feedback" value="NEUTRAL" id="NEUTRAL"><label for="NEUTRAL">中评</label></div>
                                  <div class="fr"><input type="radio" name="feedback" value="NEGATIVE" id="NEGATIVE"><label for="NEGATIVE">差评</label></div>
                                  </div><a class="btn" id="btnComment">提交评论</a>';
                    $buy_button='';
                } else {
                    $buy_stage_text='已收货';
                    $buy_status_decs='请对交易做出评价。';
                    $sell_stage_text='已释放';
                    $sell_status_decs='请对交易做出评价。';
                    $buy_button='<div class="comment" style="color: #0a0a0a">对用户<strong>'.$name['username'].'</strong>留下评论?</div>
                                  <div class="radio-cont">
                                  <div class="fl"><input type="radio" checked name="feedback" value="POSITIVE" id="POSITIVE"><label for="POSITIVE">好评</label></div>
                                  <div class="fm"><input type="radio" name="feedback" value="NEUTRAL" id="NEUTRAL"><label for="NEUTRAL">中评</label></div>
                                  <div class="fr"><input type="radio" name="feedback" value="NEGATIVE" id="NEGATIVE"><label for="NEGATIVE">差评</label></div>
                                  </div><a class="btn" id="btnComment">提交评论</a>';
                    $sell_button='<div class="comment" style="color: #0a0a0a">对用户<strong>'.$name['username'].'</strong>留下评论?</div>
                                  <div class="radio-cont">
                                  <div class="fl"><input type="radio" checked name="feedback" value="POSITIVE" id="POSITIVE"><label for="POSITIVE">好评</label></div>
                                  <div class="fm"><input type="radio" name="feedback" value="NEUTRAL" id="NEUTRAL"><label for="NEUTRAL">中评</label></div>
                                  <div class="fr"><input type="radio" name="feedback" value="NEGATIVE" id="NEGATIVE"><label for="NEGATIVE">差评</label></div>
                                  </div><a class="btn" id="btnComment">提交评论</a>';
                }
                break;
            case 3:
                $buy_stage_text='已结束';
                $buy_status_decs='交易成功，双方已评价。';
                $sell_stage_text='已结束';
                $sell_status_decs='交易成功，双方已评价。';
                $buy_button='';
                $sell_button='';
                break;
            case 4:
                $buy_stage_text='已取消';
                $buy_status_decs='您取消了交易';
                $sell_stage_text='已取消';
                $sell_status_decs='对方取消了交易';
                $buy_button='';
                $sell_button='';
                break;
            case 5:
                $buy_stage_text='已申诉';
                $buy_status_decs='交易正在申诉';
                $sell_stage_text='已申诉';
                $sell_status_decs='交易正在申诉';
                $buy_button='<a  class="btn" style="background: #31b0d5">申诉中</a>';
                $sell_button='<a class="btn" style="background: #31b0d5">申诉中</a>';
                break;
            case 6:
                $buy_stage_text='已过期';
                $buy_status_decs='此交易已超时关闭';
                $sell_stage_text='已过期';
                $sell_status_decs='此交易已超时关闭';
                $buy_button='';
                $sell_button='';
                break;
        }
        /*聊天记录*/
        $chatlog=M('chatlog')->where(array('order_id'=>$id))->order('time')->select();

        /*广告主信息*/
        $sellinfo=M('user')->where(array('id'=>$orderinfo['sellid']))->find();
        $intro=M('intro')->where(array('userid'=>$orderinfo['sellid']))->getField('content');
		$this -> assign('id',$tid);
        $this->assign('buy_stage_text', $buy_stage_text);
        $this->assign('buy_status_decs', $buy_status_decs);
        $this->assign('sell_stage_text', $sell_stage_text);
        $this->assign('sell_status_decs', $sell_status_decs);
        $this->assign('buy_button', $buy_button);
        $this->assign('sell_button', $sell_button);
        $this->assign('name', $name);
        $this->assign('ordertype', $orderinfo['type']);
        $this->assign('intro', $intro);
        $this->assign('sellinfo', $sellinfo);
        $this->assign('orderinfo', $orderinfo);
        $this->assign('chatlog', $chatlog);
        $this->display();
    }

   /*订单取消*/
    public function ordercenter()
    {
        if (IS_AJAX) {
            $orderid=I('post.orderid');
            if (!is_numeric($orderid)) {
                $this->error('订单号错误');
            }
            $orderinfo=M('order')->where(array('id'=>$orderid))->find();
            if (session('userid')==$orderinfo['buyid']) {
                if ($orderinfo['status'] == 2) {
                    $this->error('卖家已释放,不能取消');
                } elseif ($orderinfo['status'] == 3) {
                    $this->error('订单已完成,不能取消');
                } elseif ($orderinfo['status'] == 5) {
                    $this->error('订单正在申诉,不能取消');
                } elseif ($orderinfo['status'] == 6) {
                    $this->error('订单已超时,自动关闭');
                }
                if ($orderinfo['type']) {
                     /*订单为出售*/
                     M()->startTrans();
                     $re[]=M('user_coin')->where(array('userid'=>$orderinfo['sellid']))->setDec($orderinfo['coin'].'d', $orderinfo['num']);

                     $re[]=M('user_coin')->where(array('userid'=>$orderinfo['sellid']))->setInc($orderinfo['coin'], $orderinfo['num']);

                     $data['status']=4;
                     $data['endtime']=time();

                     $re[]=M('order')->where(array('id'=>$orderid))->save($data);

                    if (check_arr($re)) {
                        M()->commit();
                        $this->success('取消订单成功');
                    } else {
                        M()->rollback();
                        $this->error('取消订单失败');
                    }
                } else {
                    /*订单为购买*/
                    M()->startTrans();
                    $re[]=M('user_coin')->where(array('userid'=>$orderinfo['sellid']))->setDec($orderinfo['coin'].'d', $orderinfo['num']+$orderinfo['fee']);

                    $re[]=M('user_coin')->where(array('userid'=>$orderinfo['sellid']))->setInc($orderinfo['coin'], $orderinfo['num']+$orderinfo['fee']);

                    $data['status']=4;
                    $data['endtime']=time();

                    $re[]=M('order')->where(array('id'=>$orderid))->save($data);
                    if (check_arr($re)) {
                        M()->commit();
                        $this->success('取消订单成功');
                    } else {
                        M()->rollback();
                        $this->error('取消订单失败');
                    }
                }
            } else {
                $this->error('卖方不能取消订单');
            }
        }
    }

    /*标记已付款*/
    public function bjfk()
    {
        if (IS_AJAX) {
            $orderid=I('post.orderid');
            if (!is_numeric($orderid)) {
                $this->error('订单号错误');
            }
            $orderinfo=M('order')->where(array('id'=>$orderid))->find();
            if (session('userid')==$orderinfo['buyid']) {
                if ($orderinfo['status'] != 0) {
                     $this->error('付款错误,或者已付款');
                }
                $re=M('order')->where(array('id'=>$orderid))->setField('status', '1');
                if ($re) {
                    $this->success('付款成功');
                } else {
                    $this->error('付款失败');
                }
            } else {
                $this->error('这不是您的订单');
            }
        }
    }

    /*释放虚拟币*/
    public function shifang()
    {
        if (IS_AJAX) {
            $orderid=I('post.orderid');
            if (!is_numeric($orderid)) {
                $this->error('订单号错误');
            }
            $orderinfo=M('order')->where(array('id'=>$orderid))->find();
            if (session('userid')==$orderinfo['sellid']) {
                if ($orderinfo['status'] != 1) {
                    $this->error('对方还没有付款');
                }

                $config=M('config')->where(array('id'=>1))->find();

                if ($orderinfo['type']) {
                    /*订单为出售*/
                    M()->startTrans();
                    $re[]=M('user_coin')->where(array('userid'=>$orderinfo['sellid']))->setDec($orderinfo['coin'].'d', $orderinfo['num']);

                    $re[]=M('user_coin')->where(array('userid'=>$orderinfo['buyid']))->setInc($orderinfo['coin'], $orderinfo['num']-$orderinfo['fee']);

                    //向主号打手续费
                    $zc_user=M('coin')->where(array('name'=>$orderinfo['coin']))->getField('zc_user');
                    if ($zc_user) {
                        if (M('user_coin')->where(array($orderinfo['coin'].'b'=>$zc_user))->find()) {
                            $re[]=M('user_coin')->where(array($orderinfo['coin'].'b'=>$zc_user))->setInc($orderinfo['coin'], $orderinfo['fee']);
                        } else {
                            $re[]=M('user_coin')->where(array($orderinfo['coin'].'b'=>$zc_user))->add(array($orderinfo['coin'].'b'=>$zc_user,$orderinfo['coin']=>$orderinfo['fee']));
                        }
                    }

                    $re[]=M('order')->where(array('id'=>$orderid))->setField('status', '2');

                    /*向上线打钱*/
                    $sellpid=M('user')->where(array('id'=>$orderinfo['sellid']))->getField('pid');
                    if ($sellpid) {
                        $re[]=M('user_coin')->where(array('userid'=>$sellpid))->setInc($orderinfo['coin'], $orderinfo['num']*$config['yqr_fee']/100);
                        $re[]=M('orderlog')->add(array('userid'=>$sellpid,'traders'=>$orderinfo['sellid'],'coin_type'=>$orderinfo['coin'],'price'=>$orderinfo['price'],'num'=>$orderinfo['num']*$config['yqr_fee']/100,'amount'=>$orderinfo['price']*$orderinfo['num']*$config['yqr_fee']/100,'order_type'=>3,'addtime'=>time()));
                    }

                    /*添加记录*/
                    $re[]=M('orderlog')->add(array('userid'=>$orderinfo['buyid'],'traders'=>$orderinfo['sellid'],'coin_type'=>$orderinfo['coin'],'order_type'=>0,'price'=>$orderinfo['price'],'num'=>$orderinfo['num'],'amount'=>$orderinfo['amount'],'fee'=>$orderinfo['fee'],'addtime'=>time()));

                    $re[]=M('orderlog')->add(array('userid'=>$orderinfo['sellid'],'traders'=>$orderinfo['buyid'],'coin_type'=>$orderinfo['coin'],'order_type'=>1,'price'=>$orderinfo['price'],'num'=>$orderinfo['num'],'amount'=>$orderinfo['amount'],'fee'=>0,'addtime'=>time()));

                    if (check_arr($re)) {
                        M()->commit();
                        $this->success('付款成功');
                    } else {
                        M()->rollback();
                        $this->error('付款失败');
                    }
                } else {
                    /*订单为购买*/
                    M()->startTrans();
                    $re[]=M('user_coin')->where(array('userid'=>$orderinfo['sellid']))->setDec($orderinfo['coin'].'d', $orderinfo['num']+$orderinfo['fee']);

                    $re[]=M('user_coin')->where(array('userid'=>$orderinfo['buyid']))->setInc($orderinfo['coin'], $orderinfo['num']);

                    //TODO:向主号打手续费
                    $zc_user=M('coin')->where(array('name'=>$orderinfo['coin']))->getField('zc_user');
                    if ($zc_user) {
                        if (M('user_coin')->where(array($orderinfo['coin'].'b'=>$zc_user))->find()) {
                            $re[]=M('user_coin')->where(array($orderinfo['coin'].'b'=>$zc_user))->setInc($orderinfo['coin'], $orderinfo['fee']);
                        } else {
                            $re[]=M('user_coin')->where(array($orderinfo['coin'].'b'=>$zc_user))->add(array($orderinfo['coin'].'b'=>$zc_user,$orderinfo['coin']=>$orderinfo['fee']));
                        }
                    }

                    /*向上线打钱*/
                    $buypid=M('user')->where(array('id'=>$orderinfo['buyid']))->getField('pid');
                    if ($buypid) {
                        $re[]=M('user_coin')->where(array('userid'=>$buypid))->setInc($orderinfo['coin'], $orderinfo['num']*$config['yqr_fee']/100);
                        $re[]=M('orderlog')->add(array('userid'=>$buypid,'traders'=>$orderinfo['buyid'],'coin_type'=>$orderinfo['coin'],'price'=>$orderinfo['price'],'num'=>$orderinfo['num']*$config['yqr_fee']/100,'amount'=>$orderinfo['price']*$orderinfo['num']*$config['yqr_fee']/100,'order_type'=>3,'addtime'=>time()));
                    }

                    /*添加记录*/
                    $re[]=M('orderlog')->add(array('userid'=>$orderinfo['buyid'],'traders'=>$orderinfo['sellid'],'coin_type'=>$orderinfo['coin'],'order_type'=>0,'price'=>$orderinfo['price'],'num'=>$orderinfo['num'],'amount'=>$orderinfo['amount'],'fee'=>0,'addtime'=>time()));

                    $re[]=M('orderlog')->add(array('userid'=>$orderinfo['sellid'],'traders'=>$orderinfo['buyid'],'coin_type'=>$orderinfo['coin'],'order_type'=>1,'price'=>$orderinfo['price'],'num'=>$orderinfo['num'],'amount'=>$orderinfo['amount'],'fee'=>$orderinfo['fee'],'addtime'=>time()));

                    $re[]=M('order')->where(array('id'=>$orderid))->setField('status', '2');
                    if (check_arr($re)) {
                        M()->commit();
                        $this->success('付款成功');
                    } else {
                        M()->rollback();
                        $this->error('付款失败');
                    }
                }
            } else {
                $this->error('这不是您的订单');
            }
        }
    }

    /*评论*/
    public function pinglun()
    {
        if (IS_AJAX) {
            $orderid=I('post.orderid');
            $feedback=I('post.feedback/s');
            if (!is_numeric($orderid)) {
                $this->error('订单号错误');
            }

            $orderinfo=M('order')->where(array('id'=>$orderid))->find();

            if ($orderinfo['status']!=2) {
                $this->error('不能评论');
            }

            if ($orderinfo['sellid']==session('userid')) {
                $data['userid']=$orderinfo['buyid'];
            } else {
                $data['userid']=$orderinfo['sellid'];
            }

                $data['orderid']=$orderinfo['id'];
                $data['evaluation']=$feedback;
                $data['addtime']=time();
                $re=M('evaluation')->add($data);
            if (!$re) {
                $this->error('评论错误');
            } else {
                $evanum=M('evaluation')->where(array('orderid'=>$orderinfo['id']))->count();
                if ($evanum==2) {
                    $res[]=M('order')->where(array('id'=>$orderid))->setField('status', 3);
                    $res[]=M('order')->where(array('id'=>$orderid))->setField('endtime', time());
                    if (check_arr($res)) {
                        $this->success('订单完成');
                    } else {
                        $this->error('订单失败');
                    }
                } else {
                    $this->success('评论成功');
                }
            }
        }
    }

    /*申诉*/
    public function shensu()
    {
        if (IS_AJAX) {
            $orderid=I('post.orderid');
            if (!is_numeric($orderid)) {
                $this->error('订单号错误');
            }
            $orderinfo=M('order')->where(array('id'=>$orderid))->find();

            if ($orderinfo['status']==0 ||$orderinfo['status']==1) {
                M('order')->where(array('id'=>$orderid))->setField('ssqzt', $orderinfo['status']);
                $re=M('order')->where(array('id'=>$orderid))->setField('status', 5);
                if ($re) {
                    $this->success('申诉成功');
                } else {
                    $this->error('申诉失败');
                }
            } else {
                $this->error('申诉失败');
            }
        }
    }

  /*获取订单状态的*/
    public function orderstatus()
    {
        if (IS_AJAX) {
            $orderid=I('post.orderid');
            if (!is_numeric($orderid)) {
                $this->error('订单号错误');
            }
            $orderstatus=M('order')->where(array('id'=>$orderid))->getField('status');
            if (!empty($orderstatus)) {
                $this->success($orderstatus);
            } else {
                //已拍下未支付状态  判断订单是否过期
                $orderinfo = M('order')->where(array('id'=>$orderid))->find();
                if($orderinfo)
                {
                    $activetime = ceil(($orderinfo['addtime']+$orderinfo['delaytime']*60-time())/60);
                    if(!$activetime){
                        //订单过期
                        if ($orderinfo['type']) {
                            /*订单为出售*/
                            M()->startTrans();
                            $re[]=M('user_coin')->where(array('userid'=>$orderinfo['sellid']))->setDec($orderinfo['coin'].'d', $orderinfo['num']);

                            $re[]=M('user_coin')->where(array('userid'=>$orderinfo['sellid']))->setInc($orderinfo['coin'], $orderinfo['num']);

                            $data['status']=6;
                            $data['endtime']=time();

                            $re[]=M('order')->where(array('id'=>$orderid))->save($data);

                            if (check_arr($re)) {
                                M()->commit();
                            } else {
                                M()->rollback();
                            }
                        } else {
                            /*订单为购买*/
                            M()->startTrans();
                            $re[]=M('user_coin')->where(array('userid'=>$orderinfo['sellid']))->setDec($orderinfo['coin'].'d', $orderinfo['num']+$orderinfo['fee']);

                            $re[]=M('user_coin')->where(array('userid'=>$orderinfo['sellid']))->setInc($orderinfo['coin'], $orderinfo['num']+$orderinfo['fee']);

                            $data['status']=6;
                            $data['endtime']=time();

                            $re[]=M('order')->where(array('id'=>$orderid))->save($data);
                            if (check_arr($re)) {
                                M()->commit();
                            } else {
                                M()->rollback();
                            }
                        }
                    }
                }
                $this->error('错误');
            }
        }
    }

    /*保存聊天记录*/
    public function chatlog()
    {
        if (IS_AJAX) {
            $from=I('post.from');
            $to=I('post.to');
            $type=I('post.type');

            if ($type=='text') {
                $content=I('post.content');
            } else {
                $upload = new \Think\Upload();

                $upload->maxSize = 3145728;

                $upload->exts = array('jpg', 'png', 'jpeg');

                $upload->savePath = '/';

                $upload->saveName = 'time';

                $info = $upload->uploadOne($_FILES['file']);

                if (!$info) {
                    $this->error($upload->getError());
                } else {
                    $filename = '/Uploads' .$info['savepath'] . $info['savename'];
                    $content=$filename;
                }
            }

            $order_id=I('post.order_id');

            if ($content =='') {
                $this->error('输入内容不能为空');
            }

            if ($from && $to && $type && $order_id) {
                $data['from']=$from;
                $data['to']=$to;
                $data['type']=$type;
                $data['content']=$content;
                $data['order_id']=$order_id;
                $data['time']=time();
                $re=M('chatlog')->add($data);
                if ($re) {
                    $this->success($content);
                } else {
                    $this->error('错误1');
                }
            } else {
                $this->error('错误2');
            }
        }
    }
}
