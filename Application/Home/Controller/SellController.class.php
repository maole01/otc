<?php
namespace Home\Controller;

class SellController extends HomeController
{
    public function index(){
        $coin_type=strtolower(I('get.type'));
        if (!$coin_type) {
            $coin_type='9dc';
        }

        $coin_type=M('coin')->where(array('name'=>$coin_type,'status' => 1))->getField('name');
		$coinArr = M('coin') -> where(array('status'=>1)) -> select();

        if (!$coin_type) {
            $coin_type='btc';
        }
        $where['coin']=$coin_type;
        $where['a.status']=1;
        $where['ad_type']=1;

        $count = M('newad a')->where($where)->count();

        $Page = new \Think\Page($count, 10);

        $Page->setConfig('theme', '%first% %upPage% %linkPage% %downPage% %end%');

        $show = $Page->show();

        $adinfo=M('newad a')
            ->field(array('*','a.id'=>'adid'))
            ->where($where)
            ->join('cy_user_coin b on a.userid=b.userid')
            ->join('cy_user c on a.userid=c.id')
            ->order('price Desc')
            ->limit($Page->firstRow . ',' . $Page->listRows)
            ->select();


        $key_secret=get_rong_key_secret();
        $RongCloud=new \Common\Ext\RongCloud($key_secret['key'],$key_secret['secret']);
        if ($adinfo) {
            foreach ($adinfo as $k => $v) {
                $status=$RongCloud->userCheckOnline($v['userid']);
                $adinfo[$k]['zaixian']=json_decode($status)->status;
            }
        }
        $this->assign('page',$show);
        $this->assign('adinfo', $adinfo);
        $this->assign('coin_type', $coin_type);
        $this->assign('coinArr', $coinArr);
        $this->display();
    }
}