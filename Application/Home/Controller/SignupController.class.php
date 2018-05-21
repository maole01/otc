<?php


namespace Home\Controller;

class SignupController extends HomeController
{

    public function phone()
    {
        if(I('get.ref/s')){
            $this->assign('ref',I('get.ref/s'));
        }
        $this->display();
    }

    public function sendphone()
    {
        $phone = trim(I('post.mobile'));

        $where['mobile'] = $phone;

        $re = M('user')->where($where)->find();

        if (!preg_match("/^1[34578]{1}\d{9}$/", $phone)) {
            $data['status']=0;

            $data['content']='手机号码错误';

            $this->ajaxReturn($data);
        }

        if ($re) {
            $data['status']=0;

            $data['content']='手机号已经被注册';

            $this->ajaxReturn($data);
        }

        $code = rand(111111, 999999);

        session('zhuce_verify', $code);

        $content =$code;

        if (sendSMS($phone, $content)) {
            $data['status']=1;

            $data['content']='短信验证码已发送到你的手机，请查收';

            $this->ajaxReturn($data);
        } else {
            $data['status']=0;

            $data['content']='短信验证码发送失败，请重新点击发送';

            $this->ajaxReturn($data);
        }
    }

    public function register()
    {
          $data=I('post.');

          $zhuce_verify=session('zhuce_verify');

        if ($zhuce_verify!=trim($data['coder'])) {
            $this->error('验证码输入错误');
        }

          $re = M('user')->where("mobile={$data['mobile']}")->find();

        if ($re) {
            $this->error('手机号已存在');
        }
        $ref=I('post.ref/s');

        if ($ref) {

             $yqrid=M('user')->where(array('yqm'=>$ref))->getField('id');

            if ($yqrid) {

                $user['pid']=$yqrid;

            } else {

                $this->error('邀请码错误');

            }
        }

          $user['salt']=substr(md5(time()), 0, 3);

          $user['password']=md5(md5(trim($data['password'])).$user['salt']);

          $user['username']=trim($data['name']);

          $user['mobile']=trim($data['mobile']);

          $user['country_code']=trim($data['country_code']);

          $user['addtime']=time();

          $user['status']=1;

          $user['ue_img']='/Uploads/head_portrait60.png';

          $user['addip']=$_SERVER["REMOTE_ADDR"];

          $user['yqm']=make_coupon_card();
          $result=M('user')->add($user);


        if (!M('user_coin')->where('userid='.$result)->find()) {
            $res=M('user_coin')->add(array('userid'=>$result));
        }
        if ($result) {
            session('zhuce_verify', null);

            $this->success('注册成功');
        } else {
            $this->error('注册失败');
        }
    }
}




