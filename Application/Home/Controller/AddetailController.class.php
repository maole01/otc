<?php
namespace Home\Controller;

class AddetailController extends HomeController
{
    public function index()
    {
        $adid=I('get.adid/d');
        if ($adid=='' || $adid <=0) {
            redirect(U('Index/index'));
        }

        $where['a.id']=$adid;
        $where['a.status']=1;
        $adinfo=M('newad a')
            ->field(array('*','a.id'=>'adid'))
            ->where($where)
            ->join('cy_user_coin b on a.userid=b.userid')
            ->join('cy_user c on a.userid=c.id')
            ->find();
			
        if (!$adinfo) {
            redirect(U('Index/index'));
        }

        $intro=M('intro')->where(array('userid'=>$adinfo['userid']))->find();
        $ga=M('user')->where(array('id'=>session('userid')))->getField('ga');
        $this->assign('intro', $intro);
        $this->assign('adinfo', $adinfo);
        $this->assign('ga', $ga?1:0);
        $this->display();
    }

    public function gasubmit()
    {
        if (IS_AJAX) {
            $code=I('post.code/d');

            $gacode=M('user')->where(array('id'=>session('userid')))->getField('ga');

            $ga = new \Common\Ext\GoogleAuthenticator();

            $checkResult = $ga->verifyCode($gacode, $code, 2);

            if($checkResult){

               $this->success('验证成功');

            } else {

                $this->error('验证失败');

            }
        }
    }
}
