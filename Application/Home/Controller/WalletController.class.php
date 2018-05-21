<?php

namespace Home\Controller;

class WalletController extends HomeController
{
    /*充值界面*/
    public function deposit()
    {
        $userid = session('userid');

        if (!$userid) {
            redirect('/');
        }

        $coin = I('get.type');

        $coin = M('coin')->where(array('name' => $coin, 'status' => 1))
                         ->getField('name');

        if (!$coin) {
            $coin = '9dc';
        }

        $user_coin = M('user_coin')->where(array('userid' => $userid))->find();

        $user_coin[$coin] = round($user_coin[$coin], 4);

        $this->assign('user_coin', $user_coin);

        $Coin = M('coin')->where(array('name' => $coin))->find();

        $this->assign('zr_jz', $Coin['zr_jz']);

        if (!$Coin['zr_jz']) {
            $qianbao = '当前币种禁止转入';
        } else {
            if ($coin == 'wkc') {
                $qianbao = array_rand(C('WKC_PAY_ADDRESS'), 1);
                $qianbao = C('WKC_PAY_ADDRESS')[$qianbao];
                if (empty(M('User')->where(['id' => $userid])
                                   ->getField('wkcaddress'))
                ) {
                    $this->error("请先绑定链克钱包地址", "/Setting/wkcaddr");
                }
            } else {
                $qbdz = $coin . 'b';
                if (!$user_coin[$qbdz]) {
                    $address = M('address')
                        ->where("userid is null and status=0 and coin='{$coin}'")
                        ->find();

                    if (!$address) {
                        $this->error('生成钱包地址出错1！');
                    }

                    $qianbao = $address['address'];

                    $result = M('address')->where(array('address' => $qianbao))
                                          ->save(array('userid' => $userid));

                    if (!$result) {
                        $this->error('生成钱包地址出错2！');
                    }

                    $rs = M('user_coin')->where(array('userid' => $userid))
                                        ->save(array($qbdz => $qianbao));

                    if (!$rs) {
                        $this->error('生成钱包地址出错3！');
                    }
                } else {
                    $qianbao = $user_coin[$qbdz];
                }
            }
        }

        /*查询转入记录*/
        $myzr = M('myzr')->where(array('userid' => $userid))
                         ->order('addtime Desc')->select();
        /*查询转出记录*/
        $myzc = M('myzc')->where(array('userid' => $userid))
                         ->order('addtime Desc')->select();
        /*个人信息*/
        $ga = M('user')->where(array('id' => $userid))->getField('ga');

        $this->assign('qianbao', $qianbao);
        $this->assign('user_coin', $user_coin);
        $this->assign('coin', $Coin);
        $this->assign('xnb', $coin);
        $this->assign('xnbd', $coin . 'd');
        $this->assign('myzr', $myzr);
        $this->assign('myzc', $myzc);
        $this->assign('ga', $ga);
        $this->display();
    }

    /*提现*/
    public function withdraw()
    {
        $userid = session('userid');
        if (!$userid) {
            redirect('/');
        }

        $address = I('post.address');

        $num = I('post.num');

        $password = I('post.password');

        $message = I('post.message/s');

        $ga = M('user')->where(array('id' => $userid))->getField('ga');

        $moneypwd = M('user')->where(array('id' => $userid))
                             ->getField('moneypwd');

        if (!$moneypwd) {
            $this->error('请先前往用户中心设置您的资金密码！');
        }

        if ($address == '') {
            $this->error('钱包地址格式错误！');
        }

        if (!check($password, 'password')) {
            $this->error('交易密码格式错误！');
        }

        if ($ga) {
            $code    = I('post.code/d');
            $gaclass = new \Common\Ext\GoogleAuthenticator();

            $checkResult = $gaclass->verifyCode($ga, $code, 2);

            if (!$checkResult) {
                $this->error('谷歌验证码错误');
            }
        }

        $coin = I('post.coin');

        $Coin = M('Coin')->where(array('name' => $coin))->find();

        if (!$Coin) {
            $this->error('币种错误！');
        }

        $myzc_min = ($Coin['zc_min'] ? abs($Coin['zc_min']) : 0.0001);

        $myzc_max = ($Coin['zc_max'] ? abs($Coin['zc_max']) : 10000000);

        if ($num < $myzc_min) {
            $this->error('转出数量超过系统最小限制！');
        }

        if ($myzc_max < $num) {
            $this->error('转出数量超过系统最大限制！');
        }

        $user = M('user')->where(array('id' => $userid))->find();

        $inputpwd = md5(md5($password) . $user['salt']);

        if ($inputpwd != $user['moneypwd']) {
            $this->error('交易密码错误！');
        }

        $user_coin = M('user_coin')->where(array('userid' => $userid))->find();

        if ($user_coin[$coin] < $num) {
            $this->error('可用余额不足');
        }

        $qbdz = $coin . 'b';

        $fee_user = M('user_coin')->where(array($qbdz => $Coin['zc_user']))
                                  ->find();

        if ($fee_user) {
            $fee = round(($num / 100) * $Coin['zc_fee'], 8);

            $mum = round($num - $fee, 8);

            if ($mum < 0) {
                $this->error('转出手续费错误！');
            }

            if ($fee < 0) {
                $this->error('转出手续费设置错误！');
            }
        } else {
            $fee = 0;

            $mum = $num;
        }

        if ($Coin['type'] == 'qbb') {
            $mo = M();

            if ($mo->table('cy_user_coin')->where(array($qbdz => $address))
                   ->find()
            ) {
                $peer = M('user_coin')->where(array($qbdz => $address))->find();

                if (!$peer) {
                    $this->error('转出地址不存在！');
                }

                $mo = M();

                $mo->execute('set autocommit=0');

                $mo->execute('lock tables  cy_user_coin write  , cy_myzc write  , cy_myzr write , cy_myzc_fee write');

                $rs = array();

                $rs[] = $mo->table('cy_user_coin')
                           ->where(array('userid' => $userid))->setDec($coin, $num);

                $rs[] = $mo->table('cy_user_coin')
                           ->where(array('userid' => $peer['userid']))->setInc($coin, $num);
                $rs[] = $mo->table('cy_myzc')->add(array(
                                                       'userid'   => $userid,
                                                       'username' => $address,
                                                       'coinname' => $coin,
                                                       'txid'     => md5($address . $user_coin[$coin . 'b'] . time()),
                                                       'num'      => $num,
                                                       'fee'      => 0,
                                                       'mum'      => $num,
                                                       'addtime'  => time(),
                                                       'status'   => 1,
                                                       'message'  => $message,
                                                        'sort'=>0,
                                                        'endtime'=>0
                                                   ));

                $rs[] = $mo->table('cy_myzr')->add(array(
                                                       'userid'   => $peer['userid'],
                                                       'username' => $user_coin[$coin . 'b'],
                                                       'coinname' => $coin,
                                                       'txid'     => md5($user_coin[$coin . 'b'] . $address . time()),
                                                       'num'      => $num,
                                                       'fee'      => 0,
                                                       'mum'      => $num,
                                                       'addtime'  => time(),
                                                       'status'   => 1,
                                                        'sort'=>0,
                                                        'endtime'=>0
                                                   ));

                if (check_arr($rs)) {
                    $mo->execute('commit');

                    $mo->execute('unlock tables');

                    $this->success('转账成功！');
                } else {
                    $mo->execute('rollback');

                    $this->error('转账失败!');
                }
            } else {
                if (!$Coin['zc_jz']) {
                    $this->error($address . '当前禁止转出！');
                }


                $mo = M();

                $mo->execute('set autocommit=0');

                $mo->execute('lock tables  cy_user_coin write  , cy_myzc write ,cy_myzr write, cy_myzc_fee write');

                $rs = array();

                $rs[]
                    = $r = $mo->table('cy_user_coin')
                              ->where(array('userid' => $userid))->setDec($coin, $num);
                $rs[] = $aid = $mo->table('cy_myzc')->add(array(
                                                              'userid'   => $userid,
                                                              'username' => $address,
                                                              'coinname' => $coin,
                                                              'num'      => $num,
                                                              'fee'      => $fee,
                                                              'mum'      => $mum,
                                                              'addtime'  => time(),
                                                              'status'   => 0,
                                                              'message'  => $message,
                                                              'txid'     => md5($address . $user_coin[$coin . 'b'] . time()),
                                                              'sort'=>0,
                                                              'endtime'=>0
                                                          ));

                if ($fee_user) {
                    $rs[] = $mo->table('cy_myzc_fee')->add(array(
                                                               'userid'   => $fee_user['userid'],
                                                               'username' => $Coin['zc_user'],
                                                               'coinname' => $coin,
                                                               'num'      => $num,
                                                               'fee'      => $fee,
                                                               'mum'      => $mum,
                                                               'type'     => 2,
                                                               'addtime'  => time(),
                                                               'status'   => 1,
                                                                'txid'     => md5($address . $user_coin[$coin . 'b'] . time()),
                                                                'sort'=>0,
                                                                'endtime'=>0
                                                           ));
                }
                // qbdz=> wkcb    $Coin['zc_user'] => 0x     $coin =>  wkc    $fee=>0
                if ($mo->table('cy_user_coin')
                       ->where(array($qbdz => $Coin['zc_user']))->find()
                ) {
                    if($fee) {
                        $rs[]
                            = $r = $mo->table('cy_user_coin')
                            ->where(array($qbdz => $Coin['zc_user']))->setInc($coin, $fee);

                        /*
                        $coin_z = "`".$coin."`";
                        $rs[]
                            = $r = $mo->table('cy_user_coin')
                            ->where(array($qbdz => $Coin['zc_user']))->setField($coin,array( 'exp',$coin_z.'+'.$fee));
                        */
                    }
                } else {
                    $rs[]
                        = $r = $mo->table('cy_user_coin')
                                  ->add(array($qbdz => $Coin['zc_user'], $coin => $fee));
                }
                if (check_arr($rs)) {
                    $mo->execute('commit');

                    $mo->execute('unlock tables');

                    $this->success('转出申请成功,请等待审核！');

                } else {
                    $mo->execute('rollback');

                    $this->error('转出失败!');
                }
            }
        }
    }

    //账单明细
    public function bill()
    {
        $where['userid'] = session('userid');

        $count = M('orderlog')->where($where)->count();

        $Page = new \Think\Page($count, 10);

        $Page->setConfig('theme', '%first% %upPage% %linkPage% %downPage% %end%');
        $show = $Page->show();

        $list = M('orderlog a')
            ->field(array(
                        '*',
                        'a.id'      => 'orderid',
                        'a.addtime' => 'orderaddtime'
                    ))
            ->where($where)
            ->join('cy_user c on a.userid=c.id')
            ->order('orderaddtime Desc')
            ->limit($Page->firstRow . ',' . $Page->listRows)
            ->select();
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display();
    }

    public function checkwkcpay()
    {
        $where['id'] = session('userid');
        $from_addr   = M('User')->where($where)->getField('wkcaddress');
        if (!$from_addr) {
            return;
        }
        $trade_logs = M('WkcTradelog')->where([
                                                  'tradeAccount' => $from_addr,
                                                  'type'         => 1
                                              ])->order('id desc')->limit(3)
                                      ->select();
        //dump($trade_logs);
        //var_dump($trade_logs);exit;
        !is_array($trade_logs) && die("1");
        $ret = 0;
        foreach ($trade_logs as $trade_log) {
            $ispay = M('Myzr')->where(['out_order' => $trade_log['order_id']])
                              ->find();
            if (is_array($ispay)) {
                continue;
            }
            if ($trade_log['amount'] < 1) {
                continue;
            }
            $data['userid']    = session('userid');
            $data['username']  = session('username');
            $data['coinname']  = 'wkc';
            $data['num']       = $trade_log['amount'];
            $data['mum']       = $trade_log['amount'];
            $data['fee']       = 0;
            $data['sort']      = 0;
            $data['addtime']   = $trade_log['time'];
            $data['status']    = 1;
            $data['txid']      = $from_addr;
            $data['out_order'] = $trade_log['order_id'];

            $mo = M();

            $mo->execute('set autocommit=0');

            $mo->execute('lock tables  cy_user_coin write , cy_myzr  write ');

            $rs = array();

            $rs[] = $mo->table('cy_user_coin')->where(array('userid' => session('userid')))
                       ->setInc('wkc', $trade_log['amount']);
            $rs[] = $mo->table('cy_myzr')->add($data);

            if (check_arr($rs)) {
                $mo->execute('commit');

                $mo->execute('unlock tables');
                $ret = 1;
            } else {
                $mo->execute('rollback');

                $mo->execute('unlock tables');
            }

            if (!$ret) {
                continue;
            } else {
                $this->success('suc' . $ret);
            }


        }
    }
}
