<?php


namespace Home\Controller;

class LoginController extends HomeController
{

    public function phone()
    {

        $this->display();
    }

    //登錄
    public function submit()
    {

        $mobile = I('post.mobile');

        $pwd = I('post.password');

        $country_code = I('post.country_code');

        $captcha=I('post.captcha');

        if (!check_verify($captcha)) {
            $this->error('验证码输入错误');
        }

        $where['country_code'] = $country_code;

        $where['mobile'] = $mobile;

        $info = M('user')->where($where)->find();

        if (!$info) {
            $this->error('您输入的账号不存在');
        }
        //用户status为0，表示账号被禁用
        if ($info['password'] == md5(md5($pwd) . $info['salt'])) {
            if ($info['status']==0) {
                $this->error('您的账号已禁用');
            }

            if ($info['ga']) {
                $data['ga']=1;
            } else {

                $data['ga']=0;

                session('userid', $info['id']);

                session('mobile', $info['mobile']);

                session('username', $info['username']);

            }

            /*获取融云的token*/
            $rong_key_secret=get_rong_key_secret();
            $assign=array(
                'uid'=>$info['id'], // 用户id
                'avatar'=>$info['ue_img'],// 头像
                'username'=>$info['username'],// 用户名
                'rong_key'=>$rong_key_secret['key'],// 融云key
                'rong_token'=>get_rongcloud_token($info['id'])//获取融云token
            );

            session('token', $assign);

            $login['userid']=$info['id'];

            $login['addip']=$_SERVER["REMOTE_ADDR"];

            $login['addtime']=time();

            $login['status']=1;

            M('user_log')->add($login);

            $data['status']=1;

            $data['info']='登录成功';

            $data['encryptUsername']=md5($mobile);

            $this->ajaxReturn($data);
        } else {
            $this->error('密码输入错误');
        }
    }

    public function loginout()
    {

        session(null);

        redirect(U('Index/index'));
    }

    public function find_password()
    {
        if (IS_AJAX) {
            $mobile = trim(I('post.mobile'));

            $where['mobile'] = $mobile;

            $re = M('user')->where($where)->find();

            if (!preg_match("/^1[34578]{1}\d{9}$/", $mobile)) {
                $data['status'] = 0;
                $data['content'] = '手机号码错误';
                $this->ajaxReturn($data);
            }

            if (!$re) {
                $data['status'] = 0;
                $data['content'] = '您输入的手机号有误';
                $this->ajaxReturn($data);
            }

            $code = rand(111111, 999999);

            session('find_password', array('mobile' => $mobile, 'code' => $code));

            $content = $code;

            if (sendSMS($mobile, $content)) {
                $data['status'] = 1;
                $data['content'] = '短信验证码已发送到你的手机，请查收';
                $this->ajaxReturn($data);
            } else {
                $data['status'] = 0;

                $data['content'] = '短信验证码发送失败，请重新点击发送';

                $this->ajaxReturn($data);
            }
        } else {
            $this->display();
        }
    }

    public function modify_pwd()
    {

        if (IS_AJAX) {
            $mobile = I('post.mobile');

            $code = I('post.code');

            $arr = session('find_password');

            if ($mobile == $arr['mobile'] && $code == $arr['code']) {
                $this->success('正确');
            } else {
                $this->error('验证码输入错误');
            }
        } elseif (IS_GET) {
            $this->display();
        } else {
            $password = I('post.password');

            $password2 = I('post.confirm_password');

            if ($password != $password2) {
                echo '<script>alert("两次密码不一致")</script>';
                echo '<script>history.back(-1);</script>';
            }

            $mobile = session('find_password')['mobile'];

            $user = M('user')->where(array('mobile' => $mobile))->find();

            $newpassword = md5(md5(trim($password)) . $user['salt']);

            $re = M('user')->where(array('mobile' => $mobile))->setField('password', $newpassword);

            if ($re) {
                echo '<script>alert("修改成功")</script>';
                echo '<script>location.href="' . U('Index/index') . '"</script>';
            } else {
                echo '<script>alert("修改失败")</script>';
                echo '<script>history.back(-1);</script>';
            }
        }
    }

    public function gasubmit(){
        if(IS_AJAX){
            $code=I('post.code/d');
            $mobile=I('post.mobile');
            $ga = new \Common\Ext\GoogleAuthenticator();

            $user=M('user')->where(array('mobile'=>$mobile))->find();

            $checkResult = $ga->verifyCode($user['ga'], $code, 2);

            if($checkResult){

                session('userid', $user['id']);

                session('mobile', $user['mobile']);

                session('username', $user['username']);

                /*获取融云的token*/
                $rong_key_secret=get_rong_key_secret();
                $assign=array(
                    'uid'=>$user['id'], // 用户id
                    'avatar'=>$user['ue_img'],// 头像
                    'username'=>$user['username'],// 用户名
                    'rong_key'=>$rong_key_secret['key'],// 融云key
                    'rong_token'=>get_rongcloud_token($user['id'])//获取融云token
                );

                session('token', $assign);

                $data['status']=1;

                $data['info']='登录成功';

                $this->ajaxReturn($data);
            } else {
                $this->error('验证失败');
            }
        }

    }


    public  function verify(){
        $config =    array(
            'fontSize'    =>    30,// 验证码字体大小
            'length'      =>    4,     // 验证码位数
            'useNoise'    =>    false, // 关闭验证码杂点
        );
        $Verify = new \Think\Verify($config);
        ob_clean();
        $Verify->entry(1);
    }
}
