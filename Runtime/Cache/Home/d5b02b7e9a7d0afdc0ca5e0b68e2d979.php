<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <title>登录</title>
    <meta charset=utf-8"utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="coincola, bitcoin, Bitcoin, OTC, CoinCola, 比特币,  场外交易, 比特币买卖, p2p, 区块链, blockchain, localbitcoins">
    <meta name="description" content="一个自由买卖安全可信赖的比特币交易平台">
    <link rel="shortcut icon" href="/static/imgs/favicon.ico" type="image/x-icon" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="coincola, bitcoin, Bitcoin, OTC, CoinCola, 比特币,  场外交易, 比特币买卖, p2p, 区块链, blockchain, localbitcoins">
    <meta name="description" content="一个自由买卖安全可信赖的比特币交易平台">
    <link rel="shortcut icon" href="/Public/static/imgs/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/Public/static/css/common_2aed4bc732.css">
    <link rel="stylesheet" href="/Public/static/css/signup_300e4ac5b5.css">
    <link rel="stylesheet" type="text/css" href="/Public/static/iconfont/iconfont.css">
    <script src="/Public/jquery/jquery.min.js"></script>
    <script src="/Public/layui/layer.js"></script>

</head>
<body class="bg-white">

<div class="header header-xl">
    <div class="container clear-float">
        <div class="logo-wrap">
            <img src="/Public/static/imgs/logo.png">
        </div>
        <div class="nav clear-float fl">
            <a class="nav-item" href="/">首页</a>
            <a class="nav-item" href="/Buy">购买</a>
            <a class="nav-item" href="/Sell">出售</a>
        </div>
        <div class="clear-float fr clear login-box login-panel">
            <a class="user-action" href="/Signup/phone"><span class="sp iconfont">&#xe6c9;</span><span class="va-middle">注册</span></a>
        </div>
        <div class="opt">
            <div class="opt-line"></div>
            <div class="opt-line"></div>
            <div class="opt-line"></div>
        </div>
    </div>
</div>
<div class="pt-20 clear login-form container">
    <form class="form-cont">
        <input value="MOBILE" style="display:none" name="type">
        <div class="form-title mb-20">
            <span class="form-name">手机登录 </span>
        </div>
        <div class="input-cont">
            <!-- <span class="icon form-location"></span> -->
            <select searchable class="select" name="country_code">
                <option selected value="86">中国 86 </option>
            </select>
        </div>
        <div class="input-cont">
            <!-- <span class="icon form-email"></span> -->
            <input class="input"  type="email" validate check-type="phone" name="mobile" placeholder="请输入手机号码">
            <div class="form-tips"></div>
            <div class="error-msg">请输入手机号码</div>
        </div>
        <div class="input-cont">
            <!-- <span class="icon form-password"></span> -->
            <input class="input" type="text" onfocus="this.type='password'" validate check-type="password1" name="password" autocomplete="off" placeholder="请输入密码(6~16个字符或字母组成)">
            <div class="form-tips"></div>
        </div>
        <div class="input-cont"  style=" border: none; height: 40px;">
            <input class="input" type="text" name="captcha" placeholder="请输入右侧图像验证码" style="width: 50%;border-bottom: 1px solid #e9ecee; float: left;">
            <div class="captcha-cont">
               <img src="<?php echo U('Login/verify');?>" id="verify" onclick="this.src='/Login/verify?'+Math.random()" style="float:right;width: 120px;height: 40px;">
            </div>
        </div>
        <div class="form-title pt-30">
            <a href="/Login/find_password"  class="form-decs link">忘记密码</a>
        </div>
        <a class="btn submit" onclick="login()">登录</a>
        
    </form>

</div>
<div class="footer">
    <div class="container">
        <ul class="link-box clear-float">
            <li><a href="<?php echo U('user/protocol');?>">使用协议</a></li>
            <li><a href="<?php echo U('user/question');?>">常见问题</a></li>
            <li><a href="<?php echo U('user/rate');?>">费率说明</a></li>
        </ul>
    </div>
    <p class="copyright">Copyright © 2018 -  All Rights Reserved</p>
</div>
<script src="https://cdn.bootcss.com/fastclick/1.0.6/fastclick.min.js"></script>
<script type="text/javascript" src="/Public/static/js/main.js"></script>
</body>
</html>

</body>
</html>
<script>
    function login() {
        var mobile=$('[name=mobile]').val();
        var password=$('[name=password]').val();
        var country_code=$('[name=country_code]').val();
        var captcha=$('[name=captcha]').val();

        if(!(/^1\d{10}$/.test(mobile))){
            layer.msg('手机号码错误', {
                icon: 2
            });
            $('#verify').click();
            return false;
        }

        if(password==''){
            layer.msg('密码不能为空', {
                icon: 2
            });
            $('#verify').click();
            return false;
        }

        if(captcha == ''){
            layer.msg('验证码不能为空', {
                icon: 2
            });
            $('#verify').click();
            return false;
        }

        $.post("<?php echo U('Login/submit');?>",{mobile:mobile,password:password,country_code:country_code,captcha:captcha},function(data){
            if(data.status){
                if(data.ga){
                    layer.prompt({title: '输入谷歌6位验证码', formType: 0}, function(pass, index){
                        if(/^\d{6}$/.test(pass)){
                            $.post("<?php echo U('Login/gasubmit');?>",{code:pass,mobile:mobile},function (data) {
                                 if(data.status){
                                     layer.msg(data.info);
                                     /*创建IM连接*/

                                     /*登录*/
                                     setTimeout("location.href='<?php echo U('Index/index');?>'",1000);
                                 } else {
                                     layer.msg(data.info);
                                     $('#verify').click();
                                 }
                            })
                        } else {
                            layer.msg('输入的格式不正确');
                            $('#verify').click();
                        }
                    });
                } else{
                    layer.msg(data.info, {
                        icon: 1
                    });

                    setTimeout("location.href='<?php echo U('Index/index');?>'",1000);

                }
            }else{
                layer.msg(data.info, {
                    icon: 2
                });
                $('#verify').click();
            }

        },'json');
    }

   $('.opt').on('click',function(){
        $(this).siblings('.nav').slideToggle()
    });

</script>