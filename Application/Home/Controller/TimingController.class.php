<?php
 namespace Home\Controller;
 set_time_limit(0);
 class TimingController extends HomeController
{

    /*同步钱包转入记录*/
    public function qianbaozhuanru()
    {

        $coinList = M('coin')->where(array('status' => 1))->select();

        foreach ($coinList as $k => $v) {
            if ($v['type'] != 'qbb') {
                continue;
            }

            $coin = $v['name'];

            if (!$coin) {
                echo 'MM';
                continue;
            }

            $qbdz=$coin.'b';

            $userlist=M('user_coin')->where("{$qbdz} != ''")->select();

            foreach ($userlist as $v) {
                if ($coin == 'btc') {
                    $Transaction = file_get_contents('https://chain.api.btc.com/v3/address/'.$v[$qbdz]);

                    sleep(1);

                    $Transac = json_decode($Transaction, true);

                    if (!$Transac['data']) {
                        echo 'empty account continue' . "\n";
                        continue;
                    }
                    $balance=$Transac['data']['balance']/100000000;

                    if ($balance==0) {
                        echo 'balance = 0';
                        continue;
                    }
                } elseif ($coin == 'ltc') {
                    $Transaction = file_get_contents('https://chain.so/api/v2/get_address_balance/ltc/'.$v[$qbdz]);

                    sleep(1);

                    $Transac = json_decode($Transaction, true);

                    $balance=$Transac['data']['confirmed_balance'];

                    if ($balance==0) {
                        echo 'eth balance = 0';
                        continue;
                    }

                } elseif ($coin == 'eth') {

                    $Transaction = file_get_contents('https://etcchain.com/api/v1/getAddressBalance?address='.$v[$qbdz]);

                    sleep(1);

                    $Transac = json_decode($Transaction, true);

                    $balance=$Transac['balance'];

                    if ($balance==0) {
                        echo 'eth balance = 0';
                        continue;
                    }
                }

                $mo = M();

                $mo->execute('set autocommit=0');

                $mo->execute('lock tables  cy_user_coin write , cy_myzr  write ,cy_address write');

                $rs = array();

                $rs[] = $mo->table('cy_user_coin')->where(array('userid' => $v['userid']))->setInc($coin, $balance);


                $rs[] = $mo->table('cy_myzr')->add(array('userid' => $v['userid'], 'username' => $v[$qbdz], 'coinname' => $coin, 'fee' => 0, 'txid' => $v[$qbdz], 'num' =>$balance, 'mum' => $balance, 'addtime' => time(), 'status' => 1));

                $rs[] = $mo->table('cy_address')->where(array('address'=>$v[$qbdz]))->save(array('status'=>1));

                $rs[] = $mo->table('cy_user_coin')->where(array('userid' => $v['userid']))->save(array($qbdz=>''));

                if (check_arr($rs)) {
                    $mo->execute('commit');

                    $mo->execute('unlock tables');
                } else {
                    $mo->execute('rollback');

                    $mo->execute('unlock tables');
                }
            }
        }
    }



    /*判断订单是否超时*/
    public function ordertimeout()
    {
         $orderinfo=M('order')->where('status=1 or status=0')->select();
        foreach ($orderinfo as $v) {
            //到期时间
            $dqsj=$v['addtime']+$v['delaytime']*60;
            if ($dqsj<time()) {
                /*判断订单是购买 还是出售*/
                if ($v['status']==0) {
                    if ($v['type']==0) {
                        M()->startTrans();
                        $re[]=M('user_coin')->where(array('id'=>$v['sellid']))->setDec($orderinfo['coin'].'d', $v['num']+$v['fee']);

                        $re[]=M('user_coin')->where(array('id'=>$v['sellid']))->setInc($orderinfo['coin'], $v['num']+$v['fee']);

                        $data['status']=6;
                        $data['endtime']=time();

                        $re[]=M('order')->where(array('id'=>$v['id']))->save($data);

                        if (check_arr($re)) {
                            M()->commit();
                            echo  '成功';
                        } else {
                            M()->rollback();
                            echo '失败';
                        }
                    } else {
                        M()->startTrans();
                        $re[]=M('user_coin')->where(array('id'=>$v['sellid']))->setDec($orderinfo['coin'].'d', $v['num']);

                        $re[]=M('user_coin')->where(array('id'=>$v['sellid']))->setInc($orderinfo['coin'], $v['num']);

                        $data['status']=6;
                        $data['endtime']=time();

                        $re[]=M('order')->where(array('id'=>$v['id']))->save($data);

                        if (check_arr($re)) {
                            M()->commit();
                            echo '成功';
                        } else {
                            M()->rollback();
                            echo '失败';
                        }
                    }
                }
            } else {
                echo '无订单';
            }
        }
    }
}
