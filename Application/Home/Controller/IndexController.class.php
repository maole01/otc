<?php

namespace Home\Controller;

class IndexController extends HomeController
{

    public function index()
    {

        /*首页显示*/
        $buyad = M('newad')->where('ad_type=0')->order('price')->limit(2)
                           ->select();

        $sellad = M('newad')->where('ad_type=1')->order('price')->limit(2)
                            ->select();

        $this->assign('buyad', $buyad);

        $this->assign('sellad', $sellad);

        $this->display();
    }

    public function ajaxAddTID()
    {
        $return = array(
            'result' => false,
            'info'   => array(),
            'error'  => array(),
            'data'   => null,
        );
        $tId    = (int)$_POST['targetId'];//	防 sql 注入，将传参转整型
        if (isset($_SESSION['target'])) {
            $_SESSION['target'][$tId]++;
        } else {
            $_SESSION['target'][$tId] = 1;
        }
        $return['result'] = true;

        $return = json_encode($return);
        $this->ajaxReturn($return);
    }

    public function get_wkc_tradelog()
    {
        $url       = "https://walletapi.onethingpcs.com/getTransactionRecords";
        $dao       = M('WkcTradelog');
        $addresses = C('WKC_PAY_ADDRESS');
        foreach ($addresses as $address) {
            $time = $dao->where(['myAccount'=>$address])->order('id desc')->getField('time');
            ! $time && ($time = time() - 1800000);
            $content = '["' . $address . '","' . $time . '","0","1","20"]';
            $ret     = json_decode($this->curls($url, $content), 1);
            ! is_array($ret['result']) && die();
            //dump($ret);die;
            $ret['result'] = array_reverse($ret['result']);
            foreach ($ret['result'] as $log) {
                if ($log['timestamp'] <= $time) {
                    continue;
                }
                $data['time']         = $log['timestamp'];
                $data['tradeAccount'] = $log['tradeAccount'];
                $data['hash']         = $log['hash'];
                $data['title']        = $log['title'];
                $data['extra']        = $log['extra'];
                $data['type']         = $log['type'];
                $data['myAccount']    = $address;
                $data['order_id']     = $log['order_id'];
                $data['cost']         = hexdec($log['cost']) / 1000000000000000000;
                $data['amount']       = hexdec($log['amount']) / 1000000000000000000;
                $dao->add($data);
            }
        }

    }

    private function curls($url, $data_string)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                "User-Agent:Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36",
                'Content-Type: application/json; charset=utf-8',
                'Content-Length: ' . strlen($data_string),
            )
        );
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
        $data = curl_exec($ch);
        curl_close($ch);

        return $data;
    }

}
