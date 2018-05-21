<?php


namespace Home\Controller;
use Common\faceAip\AipFace;

class SettingController extends HomeController
{

    public function _initialize()
    {

        parent::_initialize();

        $userid = session('userid');

        if ($userid == null) {
            redirect(U('Login/phone'));
        }
    }

    //用户基本信息
    public function userinfo()
    {
        $userid = session('userid');
        if (IS_AJAX) {
            $content = I('post.intro');

            $intro = M('intro')->where(array('userid' => $userid))->find();

            if ($intro) {
                $data['content'] = $content;

                $data['time'] = time();

                $re = M('intro')->where(array('userid' => $userid))->save($data);
            } else {
                $data['userid'] = $userid;

                $data['content'] = $content;

                $data['time'] = time();

                $re = M('intro')->add($data);
            }

            if ($re) {
                $this->success('保存成功');
            } else {
                $this->error('保存失败');
            }
        }


        $userinfo = M('user')->where(array('id' => $userid))->find();

        $intro = M('intro')->where(array('userid' => $userid))->find();

        $this->assign('userinfo', $userinfo);

        $this->assign('intro', $intro);

        $this->display();
    }

    //用户头像上传
    public function setimg()
    {

        $upload = new \Think\Upload();

        $upload->maxSize = 3145728;

        $upload->exts = array('jpg', 'png', 'jpeg');

        $upload->savePath = '/';

        $upload->saveName = 'time';

        $info = $upload->uploadOne($_FILES['file']);

        if (!$info) {
            $this->error($upload->getError());
        } else {
            $userid = session('userid');

            $filename = $info['savepath'] . $info['savename'];

            //echo 123;exit;
            $re = M('user')->where(array('id' => $userid))->setField('ue_img', '/Uploads' . $filename);

            if ($re) {
                $data['status'] = 1;

                $data['info'] = '上传成功';

                $data['filename'] = '/Uploads' . $filename;

                $this->ajaxReturn($data);
            } else {
                $this->error('上传失败');
            }
        }
    }

    //身份验证
    public function verification()
    {
        /*
        $userid = session('userid');
        $appid = C('APP_ID');
        $apikey = C('API_KEY');
        $secretkey = C('SECRET_KEY');
        $client = new AipFace($appid,$apikey,$secretkey);

        var_dump($client);exit;
        */

        if (IS_POST) {
            $truename = I('post.real_name');
            $idcard   = I('post.number');
            if (mb_strlen($truename) < 2 && mb_strlen($truename) > 5) {
                $this->error('请输入真实姓名');
            }
            if (!validation_filter_id_card($idcard)) {
                $this->error('请输入正确的身份证号码');
            }
            $data['truename'] = $truename;

            $data['idcard'] = $idcard;

            $re = M('user')->where(array('id' => $userid))->save($data);

            if ($re) {
                $this->success('验证成功');
            } else {
                $this->error('验证失败');
            }
        }


        $userinfo = M('user')->where(array('id' => $userid))->find();
        $this->assign('userinfo', $userinfo);
        $this->display();

    }

    /*安全设置界面*/
    public function options()
    {
        $userid   = session('userid');
        $userinfo = M('user')->where(array('id' => $userid))->find();
        $this->assign('moneypwd', $userinfo['moneypwd']);
        $this->assign('google', $userinfo['ga']);
        $this->display();
    }

    /*设置资金密码*/
    public function setmoneypwd()
    {
        $userid   = session('userid');
        $userinfo = M('user')->where(array('id' => $userid))->find();
        if ($userinfo['moneypwd']) {
            redirect(U('Setting/moneypwd'));
        }
        if (IS_AJAX) {
            if (!$userinfo['moneypwd']) {
                $moneypwd  = trim(I('post.moneypwd'));
                $moneypwd2 = trim(I('post.moneypwd2'));
                if ($moneypwd != $moneypwd2) {
                    $this->error('两次密码不一致');
                }
                $pwd = md5(md5($moneypwd) . $userinfo['salt']);

                $re = M('user')->where(array('id' => $userid))->save(array('moneypwd' => $pwd));

                if ($re) {
                    $this->success('保存成功');
                } else {
                    $this->error('保存失败');
                }
            } else {
                $this->error('错误');
            }
        }

        $this->display();
    }

    /*修改资金密码*/
    public function moneypwd()
    {
        if (IS_AJAX) {
            $pwd     = trim(I('post.pwd'));
            $newpwd  = trim(I('post.newpwd'));
            $newpwd2 = trim(I('post.newpwd2'));
            if ($newpwd != $newpwd2) {
                $this->error('两次密码不一致');
            }
            $userid = session('userid');
            $info   = M('user')->where(array('id' => $userid))->find();

            if (md5(md5($pwd) . $info['salt']) == $info['moneypwd']) {
                $pwd2 = md5(md5($newpwd) . $info['salt']);
                $re   = M('user')->where(array('id' => $userid))->save(array('moneypwd' => $pwd2));
                if ($re) {
                    $this->success('修改成功');
                } else {
                    $this->error('保存失败');
                }
            } else {
                $this->error('原资金密码不对');
            }
        }
        $this->display();
    }

    /*修改登录密码*/
    public function loginpwd()
    {
        if (IS_AJAX) {
            $loginpwd = I('post.loginpwd');
            $newpwd   = I('post.newpwd');
            $newpwd2  = I('post.newpwd2');
            if ($newpwd != $newpwd2) {
                $this->error('两次密码不一致');
            }
            $userid = session('userid');

            $info = M('user')->where(array('id' => $userid))->find();

            if (md5(md5($loginpwd) . $info['salt']) == $info['password']) {
                $pwd2 = md5(md5($newpwd) . $info['salt']);
                $re   = M('user')->where(array('id' => $userid))->save(array('password' => $pwd2));
                if ($re) {
                    $this->success('修改成功');
                } else {
                    $this->error('保存失败');
                }
            } else {
                $this->error('原登录密码不对');
            }
        }
        $this->display();
    }

    /*信任您的人*/
    public function trusted()
    {
        $userid  = session('userid');
        $trusted = M('user')->where(array('id' => $userid))->getField('trusted');
        if ($trusted) {
            $arr = explode(',', $trusted);
            foreach ($arr as $v) {
                $trustedinfo[] = M('user')->where(array('id' => $v))->find();
            }
            $this->assign('trusted', $trustedinfo);
        } else {
            $this->assign('trusted', null);
        }
        $this->display();
    }

    /*您信任的人*/
    public function trusting()
    {
        $userid   = session('userid');
        $trusting = M('user')->where(array('id' => $userid))->getField('trusting');
        if ($trusting) {
            $arr = explode(',', $trusting);
            foreach ($arr as $v) {
                $trustinginfo[] = M('user')->where(array('id' => $v))->find();
            }
            $this->assign('trusting', $trustinginfo);
        } else {
            $this->assign('trusting', null);
        }
        $this->display();
    }

    /*您屏蔽的人*/
    public function blocking()
    {
        $userid   = session('userid');
        $blocking = M('user')->where(array('id' => $userid))->getField('blocking');
        if ($blocking) {
            $arr = explode(',', $blocking);
            foreach ($arr as $v) {
                $blockinginfo[] = M('user')->where(array('id' => $v))->find();
            }
            $this->assign('blocking', $blockinginfo);
        } else {
            $this->assign('blocking', null);
        }
        $this->display();
    }

    /*谷歌验证*/
    public function googleauth()
    {
        $ga   = new \Common\Ext\GoogleAuthenticator();
        $user = M('user')->where(array('id' => session('userid')))->find();
        if (IS_AJAX) {
            $code = I('post.code/d');
            if (!$code) {
                $this->error('6位验证码输入错误');
            }
            if (!$user['ga']) {
                /*绑定*/
                $checkResult = $ga->verifyCode(session('secret'), $code, 2);
                if ($checkResult) {
                    $re = M('user')->where(array('id' => session('userid')))->setField('ga', session('secret'));
                    if ($re) {
                        $this->success('绑定成功');
                    } else {
                        $this->error('绑定失败');
                    }
                } else {
                    $this->error('6位验证码输入错误');
                }
            }
        } else {
            if (!$user['ga']) {
                /*绑定界面*/
                $secret = $ga->createSecret();
                session('secret', $secret);
                $this->assign('Asecret', $secret);

                $qrCodeUrl = $ga->getQRCodeGoogleUrl($user['username'] . '%20-%20' . $_SERVER['HTTP_HOST'], $secret);

                $this->assign('qrCodeUrl', $qrCodeUrl);

                $this->assign('googlename', $user['username'] . ' - ' . $_SERVER['HTTP_HOST']);
                $this->display();
            }
        }
    }

    /*解除google*/
    public function jcgoogle()
    {
        $ga   = new \Common\Ext\GoogleAuthenticator();
        $user = M('user')->where(array('id' => session('userid')))->find();
        if (IS_AJAX) {
            $code = I('post.code/d');
            if (!$code) {
                $this->error('6位验证码输入错误');
            }
            if ($user['ga']) {
                $checkResult = $ga->verifyCode($user['ga'], $code, 2);
                if ($checkResult) {
                    $re = M('user')->where(array('id' => session('userid')))->setField('ga', '');
                    if ($re) {
                        $this->success('解绑成功');
                    } else {
                        $this->error('解绑失败');
                    }

                } else {
                    $this->error('6位验证码输入错误');
                }
            }
        } else {
            if ($user['ga']) {
                $this->display();
            }
        }
    }

    public function wkcaddr()
    {
        $uid = session('userid');
        if (IS_AJAX) {
            $wkcaddr = I('wkcaddr');
            $action  = I('action');
            if ($action == 'unbind') {
                $info = M('user')->where(['id' => $uid])->find();
                $pwd  = I('pwd');
                if ($info['password'] == md5(md5($pwd) . $info['salt'])) {
                    $ret = M('user')->where(['id' => $uid])->save(['wkcaddress' => '']);
                    $ret && $this->success('解绑成功');
                } else {
                    $this->error('密码错误 ');
                }
            } else {
                $qb_wkcaddr = I('qb_wkcaddr');
                $wkc_zhi  = I('wkc_zhi');
                strlen($wkcaddr) < 40 && $this->error('链克地址有误');
                M('User')->where(['wkcaddress' => $wkcaddr])->find() && $this->error('链克地址已被绑定');
                !empty(M('User')->where(['id' => $uid])->getField('wkcaddress')) && $this->error('您已绑定过了');

                //校验绑定用户是否有转入链克
                $res = M('WkcTradelog')->where([
                    'tradeAccount' => $wkcaddr,
                    'myAccount'    => $qb_wkcaddr,
                    'amount'       => $wkc_zhi,
                    'type'         => 1
                ])->find();
                if(!$res)
                {
                    $this->error('请您向上述钱包地址转入同等链克并耐心等待30秒');
                }

                $ret = M('User')->where(['id' => $uid])->save(['wkcaddress' => $wkcaddr]);
                if ($ret) {
                    $this->success('绑定成功');
                } else {
                    $this->error('绑定失败');
                }
            }

        }
        $userinfo = M('user')->where(array('id' => $uid))->find();
        $this->assign('userinfo', $userinfo);
        $this->display();
    }

    public function faceverify()
    {
        $appid = C('APP_ID');
        $apikey = C('API_KEY');
        $secretkey = C('SECRET_KEY');
        $client = new ApiFace($appid,$apikey,$secretkey);
    }
}
