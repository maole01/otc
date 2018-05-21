<?php

namespace Home\Controller;

class UserController extends HomeController
{
    public function view()
    {
        $id = I('get.id', '', int);
        if (!$id) {
            redirect('/');
            exit;
        }
        $info = M('user')->where(array('id' => $id))->find();
        if (!$info) {
            redirect('/');
            exit;
        }
        $myinfo = M('user')->where(array('id' => session('userid')))->find();

        /*判断是否信任*/
        $trusting = explode(',', $myinfo['trusting']);
        $is_trusting = in_array($id, $trusting);

        /*判断是否屏蔽*/
        $blocking = explode(',', $myinfo['blocking']);
        $is_blocking = in_array($id, $blocking);

        /*查询发布的广告*/
        $adlist=M('newad')->where(array('userid'=>$id,'status'=>1))->select();

        $this->assign('is_trusting', $is_trusting);
        $this->assign('is_blocking', $is_blocking);
        $this->assign('info', $info);
        $this->assign('adlist', $adlist);
        $this->display();
    }

    /*添加与取消信任*/
    public function trust()
    {
        if (!session('userid')) {
            $this->error('请先登录');
        }
        if (IS_POST) {
            $id = I('post.id', '', int);

            $userid = session('userid');

            $trusting = M('user')->where(array('id' => $userid))->getField('trusting');

            $arr = explode(',', $trusting);

            $re = in_array($id, $arr);

            if ($re) {
                /*向trusting删除数据*/
                foreach ($arr as $k => $v) {
                    if ($v == $id) {
                        unset($arr[$k]);
                    }
                }
                $str = implode(',', $arr);
                $re = M('user')->where(array('id' => $userid))->save(array('trusting' => $str));
                /*向trusted删除数据*/
                $trusted = M('user')->where(array('id' => $id))->getField('trusted');
                $arr2 = explode(',', $trusted);
                if (in_array($userid, $arr2)) {
                    foreach ($arr2 as $k => $v) {
                        if ($v == $userid) {
                            unset($arr2[$k]);
                        }
                    }
                    $trusted = implode(',', $arr2);
                    $re2 = M('user')->where(array('id' => $id))->save(array('trusted' => $trusted));
                }
                if ($re && $re2) {
                    $this->success('取消信任成功');
                } else {
                    $this->error('取消信任失败');
                }
            } else {
                if ($trusting) {
                    $trusting .= ',' . $id;
                    $str = $trusting;
                } else {
                    $str = $id;
                }
                /*向trusting添加数据*/
                $re = M('user')->where(array('id' => $userid))->save(array('trusting' => $str));

                /*向trusted添加数据*/
                $trusted = M('user')->where(array('id' => $id))->getField('trusted');

                $arr2 = explode(',', $trusted);
                if (!in_array($userid, $arr2)) {
                    if ($trusted) {
                        $trusted .= ',' . $userid;
                    } else {
                        $trusted = $userid;
                    }
                    $re2 = M('user')->where(array('id' => $id))->save(array('trusted' => $trusted));
                }
                if ($re && $re2) {
                    $this->success('信任成功');
                } else {
                    $this->error('信任失败');
                }
            }
        }
    }

    /*添加与取消屏蔽*/
    public function blocking()
    {
        if (!session('userid')) {
            $this->error('请先登录');
        }
        if (IS_POST) {
            $id = I('post.id', '', int);

            $userid = session('userid');

            $blocking = M('user')->where(array('id' => $userid))->getField('blocking');

            $arr = explode(',', $blocking);

            $is_blocking = in_array($id, $arr);

            if ($is_blocking) {
                /*取消屏蔽*/
                foreach ($arr as $k => $v) {
                    if ($v == $id) {
                        unset($arr[$k]);
                    }
                }
                $str = implode(',', $arr);
                $re = M('user')->where(array('id' => $userid))->save(array('blocking' => $str));
                if ($re) {
                    $this->success('取消屏蔽成功');
                } else {
                    $this->error('取消屏蔽失败');
                }
            } else {
                /*添加屏蔽*/
                if ($blocking) {
                    $blocking .= ',' . $id;
                    $str = $blocking;
                } else {
                    $str = $id;
                }
                /*向trusting添加数据*/
                $re = M('user')->where(array('id' => $userid))->save(array('blocking' => $str));

                if ($re) {
                    $this->success('屏蔽成功');
                } else {
                    $this->error('屏蔽失败');
                }
            }
        }
    }

    /*使用协议*/
    public function protocol(){
        $this->display();
    }

    /*常见问题*/
    public function question(){
        $this->display();
    }

    /*费率说明*/
    public function rate(){
        $this->display();
    }



}
