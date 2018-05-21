<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <title>找回密码</title>
    <meta charset=utf-8"utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="coincola, bitcoin, Bitcoin, OTC, CoinCola, 比特币, 可盈可乐, 场外交易, 比特币买卖, p2p, 区块链, blockchain, localbitcoins">
    <meta name="description" content="一个自由买卖安全可信赖的比特币交易平台">
    <link rel="shortcut icon" href="/Public/static/imgs/favicon.ico" type="image/x-icon" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="coincola, bitcoin, Bitcoin, OTC, CoinCola, 比特币, 可盈可乐, 场外交易, 比特币买卖, p2p, 区块链, blockchain, localbitcoins">
    <meta name="description" content="一个自由买卖安全可信赖的比特币交易平台">
    <link rel="shortcut icon" href="/Public/static/imgs/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/Public/static/css/common_2aed4bc732.css">
    <link rel="stylesheet" href="/Public/static/css/signup_300e4ac5b5.css">
    <script src="/Public/jquery/jquery.min.js"></script>
    <script src="/Public/layui/layer.js"></script>
</head>
<body class="bg-white">
<div class="header header-xl">
    <div class="container clear-float">
        <a href="/"><span class="logo-b"></span></a>
        <div class="xl-logo">
            <h1 class="xl-title">找回密码</h1>
            <h3 class="xl-decs">请通过手机或邮箱来找回密码</h3>
        </div>
       <!--  <div class="opt">
            <div class="opt-line"></div>
            <div class="opt-line"></div>
            <div class="opt-line"></div>
        </div> -->
    </div>
</div>
<div class="clear pt-20 login-form container">
    <form class="form-cont" action="<?php echo U('Login/modify_pwd');?>" method="get" id="formid" >
        <div class="form-title mb-20">
            <span class="form-name">手机找回 </span>
        </div>
        <div class="input-cont">
            <!-- <span class="icon form-location"></span> -->
            <select searchable class="select" name="country_code">

                <option  selected  value="86">中国 86</option>

            </select>
        </div>
        <div class="input-cont">
            <!-- <span class="icon form-phone"></span> -->
            <input class="input" name="mobile" type="phone" validate check-type="phone" placeholder="请输入手机号码" onblur="regphone()">
            <div class="form-tips"></div>
            <div class="error-msg">请输入手机号码</div>
        </div>
        <div class="input-cont">
            <!-- <span class="icon form-token"></span> -->
            <input class="input" type="number" validate name="one_time_code" check-type="one_time_code" placeholder="请输入验证码" onblur="regcode()">
            <div class="form-tips"></div>
            <div class="error-msg">请输入验证码</div>
            <input type="button"  class="link get-token" id="sendcode" onclick="sendCode()" value="发送验证码">
        </div>
        <a class="btn submit next" id="submit" onclick="checkform()">下一步</a>
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
<html>

<script>
    function regphone() {

        if(/^1\d{10}$/.test($('[name=mobile]').val())){

            $("input[name=mobile]").next().next().css('display','none');

            return true;

        }else{

            $("input[name=mobile]").next().next().css('display','block');

            return false;

        }
    }

    function sendCode(){

        if(!regphone()){
            return false;
        }
        var mobile=$("input[name=mobile]").val();
        $.post("<?php echo U('Login/find_password');?>",{mobile:mobile},function(data) {
            if (data.status == 1) {
                layer.msg(data.content, {
                    icon: 1
                });
                $('#sendcode').attr("disabled", "disabled");
                var obj = $('#sendcode');
                var wait = 120;
                var interval = setInterval(function () {
                    obj.val(wait + '秒再次发送');
                    wait--;
                    if (wait < 0) {
                        clearInterval(interval);
                        $('#sendcode').attr("disabled", false);
                        obj.val('获取验证码');
                    }
                    ;
                }, 1000);
            } else {
                layer.msg(data.content, {
                    icon: 2
                });
            }
        }, "json");

    }

    function regcode() {

        if(/^\d{6}$/.test($('[name=one_time_code]').val())){

            $("input[name=one_time_code]").next().next().css('display','none');

            return true;

        }else{

            $("input[name=one_time_code]").next().next().css('display','block');

            return false;

        }
    }

   function checkform(){

        if(!regphone()){
            return false;
        }
        if(!regcode()){
            return false;
        }

        var mobile = $('[name=mobile]').val();
        var code = $('[name=one_time_code]').val();

        $.post('<?php echo U("Login/modify_pwd");?>',{mobile:mobile,code:code},function(data){

            if(data.status){

                $('#formid').submit();
                return true;

            } else{
                layer.msg(data.info, {
                    icon: 2
                });

                return false;
            }

        });

    };
      $('.opt').on('click',function(){
        console.log(1)
        $(this).siblings('.nav').slideToggle()
    })
    
</script>