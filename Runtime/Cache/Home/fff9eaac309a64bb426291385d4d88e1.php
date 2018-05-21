<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <title>一个自由买卖安全可信赖的交易平台</title>
    <meta charset=utf-8"utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit">
    <link rel="shortcut icon" href="/static/imgs/favicon.ico" type="image/x-icon" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit">
    <link rel="shortcut icon" href="/static/imgs/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/Public/static/css/common_2aed4bc732.css" >
    <link rel="stylesheet" href="/Public/static/css/index_9b484c78b0.css" >
    <link rel="stylesheet" href="/Public/static/css/main.css" >
    <link rel="stylesheet" type="text/css" href="/Public/static/iconfont/iconfont.css">
    <script src="/Public/jquery/jquery.min.js"></script>
    <script src="/Public/layui/layer.js"></script>
    <script src="https://cdn.bootcss.com/fastclick/1.0.6/fastclick.min.js"></script>
    <script src="https://cdn.ronghub.com/RongIMLib-2.2.9.min.js"></script>
	<style>
		.targetDiv{background:#ddd;color:#fff;padding:8px;border-radius:5px;cursor:none;position:absolute;right:150px;top:20px;}
	</style>
</head>
<body class="zh-CN">
<div class="header zh-CN">
    <div class="header-box container clear-float">
        <div class="logo-wrap">
            <img src="/Public/static/imgs/logo.png">
        </div>
        <div class="nav clear-float fl">
            <a class="nav-item " href="<?php echo U('Index/index');?>" >首页</a>
            <a class="nav-item " href="/Buy">购买</a>
            <a class="nav-item " href="/Sell">出售</a>
            <a class="nav-item " href="/Newad" >发布买卖</a>
            <a class="nav-item " href="/activities" >邀请好友</a>
            <a class="nav-item" href="#">
				<img src="/Public/static/imgs/qq_ico1png.png" style="width:20px;margin-top:-8px;margin-right:2px;"/>担保群
			</a>
			<a class="nav-item" href="#">
				<img src="/Public/static/imgs/qq_ico2png.png" style="width:20px;margin-top:-8px;margin-right:2px;"/>
				担保Q
			</a>
        </div>
        <div class="clear-float fr login-panel" <?php if(!empty($sessioninfo["userid"])): ?>style="display:none"<?php endif; ?>>
        <a class="user-action" href="/Signup/phone"><span class="sp iconfont">&#xe6c9;</span><span class="va-middle">注册</span></a>
        <a class="user-action btn-login" href="/login/phone" ><span class="sp iconfont">&#xe6c9;</span><span class="va-middle">登录</span></a>
    </div>
    <div class="clear-float fr my-panel" <?php if(empty($sessioninfo["userid"])): ?>style="display:none"<?php endif; ?>>
    <div  class="item" id="orderPrompt" style="position:relative;">
        <a href="<?php echo U('Order/lists');?>"  class="item-label"><span class="iconfont">&#xe613;</span> <span>订单</span> <span class="message-count" style="display: none"></span> <!-- <span class="iconfont arrow">&#xe601;</span> --></a>
        <div class="item-more item-message"></div>
    </div>
    <div class="item">
        <a href="<?php echo U('Wallet/deposit',array('type'=>'wkc'));?>" class="item-label">
            <span class="iconfont">&#xe672;</span>
            <span class="va-mid">钱包</span>
            <span class="iconfont arrow">&#xe601;</span>
        </a>
        <div class="item-more item-wallet" style="
    width: 500px;
    left: -380px;
">
            <div class="wallet-item" style="
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0,0,0,.05);
    text-align: center;
">
                <div class="text-total" style="
    font-size: 12px;
    color: #677686;
">总资产
                </div>
                <div class="wallet-cont" style="
    border-bottom: 1px solid #e5eaef;
    min-height: 34px;
    line-height: 35px;
    font-size: 14px;
    color: #25495e;
    position: relative;
">
                    WKC: <span class="" style="width:90px;display:inline-block;margin-right: 30px;"><?php echo ($moneyinfo['wkc']+$moneyinfo['wkcd']); ?></span>

                </div>
                <div class="wallet-cont clear-float" style="
    padding: 10px 0;
    border-bottom: 1px solid #e5eaef;
    min-height: 34px;
    line-height: 35px;
    font-size: 14px;
    color: #25495e;
    position: relative;
">
                    <div class="col-33 ta-l" style="
    float: left;
    font-size: 12px;
    color: #25495e;
">
                        <div class="text">币种</div>
                        <div class="text">WKC</div>


                    </div>
                    <div class="col-33 ta-l" style="
    float: left;
    font-size: 12px;
    color: #25495e;
">
                        <div class="text">可用资产</div>
                        <div class="text BTC_available"><?php echo ($moneyinfo["wkc"]); ?></div>

                    </div>
                    <div class="col-33 ta-r" style="
    float: left;
    font-size: 12px;
    color: #25495e;
">
                        <div class="text">冻结资产</div>
                        <div class="text BTC_lock"><?php echo ($moneyinfo["wkcd"]); ?></div>

                    </div>
                </div>

                <div class="clear-float">
                    <a class=" btn " href="<?php echo U('Wallet/bill');?>">账单明细</a>
                    <a class="refresh-wallet btn ml-20" onclick="location.reload()">刷新</a>
                </div>

            </div>
        </div>

    </div>
    <div class="item" >
        <a href="<?php echo U('Setting/userinfo');?>" class="item-label  width-110"><span class="iconfont">&#xe6c9;</span> <span class="username"><?php echo ($sessioninfo["username"]); ?></span> <span class="iconfont arrow">&#xe601;</span></a>
        <div class="item-more item-my width-110">
            <a class="link" href="<?php echo U('Setting/userinfo');?>" >用户中心</a>
            <!-- <a class="link" href="/manage/order-sell">我的交易</a> -->
            <a class="link" href="<?php echo U('Manage/adsell');?>">我的广告</a>
            <a class="link" id="logout" href="<?php echo U('Login/loginout');?>">退出</a>
        </div>
    </div>
</div>
<div class="opt">
    <div class="opt-line"></div>
    <div class="opt-line"></div>
    <div class="opt-line"></div>
</div>
</div>
</div>

<script>
    $(document).ready(function(){
        $("a.menu-item").each(function(){
            if(this.href==String(window.location)){
                $(this).addClass("active");
            }
        });
        if ('addEventListener' in document) {
            document.addEventListener('DOMContentLoaded', function() {
                FastClick.attach(document.body);
            }, false);
        }
        $(function() {
            FastClick.attach(document.body);
        });
        $('.my-panel .item').on('click',function() {

            $(this).find('.item-more').toggle()
        })
        $('.opt').on('click',function(){

            $(this).siblings('.nav').slideToggle()
        })

    });
</script>

<script>
	var target = new Array("<?php echo ($_SESSION['target']); ?>");
	if(target[0] === 'Array'){
		$('#orderPrompt').prepend(function(){
			if(!($(this).children('#remind').html())){
				var str = '<div id="remind" style="color:#fff;font-weight:800;background:#fa0;width:20px;height:20px;border-radius:20px;position:absolute;top:-0px;text-align:center;right:0px;">!</div>';
				return str;
			}
		});
	}
    RongIMClient.init("<?php echo ($_SESSION['token']['rong_key']); ?>");

    var token = "<?php echo ($_SESSION['token']['rong_token']); ?>";
	var conversationTypes = [RongIMLib.ConversationType.PRIVATE,RongIMLib.ConversationType.DISCUSSION];

    RongIMClient.setConnectionStatusListener({
        onChanged: function (status) {
            switch (status) {
                case RongIMLib.ConnectionStatus.CONNECTED:
                    console.log('链接成功');
                    break;
                case RongIMLib.ConnectionStatus.CONNECTING:
                    console.log('正在链接');
                    break;
                case RongIMLib.ConnectionStatus.DISCONNECTED:
                    console.log('断开连接');
                    break;
                case RongIMLib.ConnectionStatus.KICKED_OFFLINE_BY_OTHER_CLIENT:
                    console.log('其他设备登录');
                    break;
                case RongIMLib.ConnectionStatus.DOMAIN_INCORRECT:
                    console.log('域名不正确');
                    break;
                case RongIMLib.ConnectionStatus.NETWORK_UNAVAILABLE:
                    console.log('网络不可用');
                    break;
            }
        }}
	);
    // 消息监听器
    RongIMClient.setOnReceiveMessageListener({
        // 接收到的消息
        onReceived: function (message) {
			var targetId = message.targetId;
			$.post('/Index/ajaxAddTID',{targetId:targetId},function(){

			});
			//	动画提示
			$('#orderPrompt').prepend(function(){
				if(!($(this).children('#remind').html())){
					var str = '<div id="remind" style="color:#fff;font-weight:800;background:#fa0;width:20px;height:20px;border-radius:20px;position:absolute;top:-0px;text-align:center;right:0px;">!</div>';
					return str;
				}
			});

			RongIMClient.getInstance().getTotalUnreadCount({
				onSuccess:function(count){
					console.log(count);
				 // count => 所有会话总未读数。
				},
				onError:function(error){
					console.log(error);
				 // error => 获取总未读数错误码。
				}
			});
			console.log('true');
			//	有消息传入，开始提醒用户
            // 判断消息类型
            switch(message.messageType){
                case RongIMClient.MessageType.TextMessage:
                    break;

                case RongIMClient.MessageType.ImageMessage:
                    // message.content.content => 图片缩略图 base64。
                    // message.content.imageUri => 原图 URL。
                    break;
                default:
                // do something...
            }
        }
    });

	/*
	RongIMClient.getInstance().hasRemoteUnreadMessages(token,{
		onSuccess:function(hasMessage){
			console.log(hasMessage);
			if(hasMessage){
				// 有未读的消息
			}else{
				// 没有未读的消息
			}
		},onError:function(err){
			// 错误处理...
		}
	});
	*/
    RongIMClient.connect(token, {
        onSuccess: function(userId) {
            console.log("Connect successfully." + userId);
        },
        onTokenIncorrect: function() {
            console.log('token无效');
        },
        onError:function(errorCode){
            var info = '';
            switch (errorCode) {
                case RongIMLib.ErrorCode.TIMEOUT:
                    info = '超时';
                    break;
                case RongIMLib.ErrorCode.UNKNOWN_ERROR:
                    info = '未知错误';
                    break;
                case RongIMLib.ErrorCode.UNACCEPTABLE_PaROTOCOL_VERSION:
                    info = '不可接受的协议版本';
                    break;
                case RongIMLib.ErrorCode.IDENTIFIER_REJECTED:
                    info = 'appkey不正确';
                    break;
                case RongIMLib.ErrorCode.SERVER_UNAVAILABLE:
                    info = '服务器不可用';
                    break;
            }
            console.log(errorCode);
        }
    });

</script>


<link rel="stylesheet" href="/Public/static/css/setting_8ae286f527.css">
<div class="container clear-float main">
    <div class="setting-leftmenu fl">
        <div class="menu-head">用户中心</div>
        <div class="left-menu-wrap">
            <div class="menu-c">
                <div class="icon-fold"></div>
                <div class="menu-title">用户资料</div>
                <div class="menu-item-cont">
                    <a href="<?php echo U('Setting/userinfo');?>" class="menu-item">基本信息</a>
                    <a href="<?php echo U('Setting/wkcaddr');?>" class="menu-item">链克地址</a>
                    <a href="<?php echo U('Setting/verification');?>" class="menu-item ">身份验证</a>
                </div>
            </div>
            <div class="menu-c">
                <div class="icon-fold"></div>
                <div class="menu-title">账户安全</div>
                <div class="menu-item-cont">
                    <a href="<?php echo U('Setting/options');?>" class="menu-item ">安全设置</a>
                </div>
            </div>
            <div class="menu-c bt">
                <div class="icon-fold"></div>
                <div class="menu-title">受信任的</div>
                <div class="menu-item-cont">
                    <a href="<?php echo U('Setting/trusted');?>" class="menu-item ">信任您的人</a>
                    <a href="<?php echo U('Setting/trusting');?>" class="menu-item ">您信任的人</a>
                    <a href="<?php echo U('Setting/blocking');?>" class="menu-item ">您屏蔽的人</a>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript"></script>


    <div class="fr right-wrap">
        <div class="setting-title">基本信息</div>
        <div class="setting-panel">
            <div class="head-cont">
                <img class="user-logo" src="<?php echo ($userinfo["ue_img"]); ?>" alt="">
                <a class="edit-logo">编辑头像</a>
                <form action="<?php echo U('Setting/setimg');?>" id="form" method="post" enctype="multipart/form-data">
                    <input class="avatar-input" id="file" name="file" type="file"
                           accept="image/jpg,image/jpeg,image/png" onchange="preview(this)">
                </form>
            </div>
            <div class="user-profile">
                <div class="user-name"><?php echo ($userinfo["username"]); ?></div>
                <ul class="profile-detail">
                    <li class="profile-item">
                        <span class="item-name">身份验证: </span>

                        <?php echo ($userinfo['idcard']?'<span>已验证</span>':'<a href="/setting/user-verification"
                                                                    class="link">未验证</a>'); ?>

                    </li>
                    <li class="profile-item">
                        <span class="item-name">手机号码: </span>

                        <span class="item-text"><?php echo ($userinfo['mobile']?'已验证':'未验证'); ?></span>

                    </li>
                    <li class="profile-item">
                        <span class="item-name">注册时间: </span>
                        <span class="item-text"><?php echo (date('Y-m-d H:i:s',$userinfo["addtime"])); ?></span>
                    </li>

                    <li class="profile-item">
                        <span class="item-name">信任人数: </span>
                        <span class="item-text">被 <?php echo (getxrrs($userinfo["id"])); ?> 人信任</span>
                    </li>
                    <li class="profile-item">
                        <span class="item-name">累计交易次数: </span>
                        <span class="item-text"><?php echo (getjycs($userinfo["id"])); ?></span>
                    </li>
                    <li class="profile-item">
                        <span class="item-name">累计交易量: </span>
                        <span class="item-text"><?php echo (getcjsl($userinfo["id"])); ?> <span class="link">wkc</span></span>
                    </li>
                </ul>
                <div class="form-cont">
                    <div class="input-cont new-ad">
                        <textarea class="input textarea" name="intro" autocomplete="off"
                                  placeholder=简介，在您的公共资料上展示您的介绍信息。纯文本，不超过200个字><?php echo ($intro["content"]); ?></textarea>
                        <div class="mt-10">请勿填写您邮箱，避免收到钓鱼邮件</div>
                    </div>
                    <a class="btn submit fr save-mark" onclick="submitIntro()">保存</a>
                </div>
            </div>
        </div>
    </div>
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



<script type="text/javascript">
    function preview(file) {
        if (file.files && file.files[0]) {
            var reader = new FileReader();
            reader.onload = function (evt) {
                index = layer.open({
                    type: 1,
                    title: false,
                    closeBtn: 0,
                    shadeClose: true,
                    skin: 'yourclass',
                    content: '<table class="ui-dialog-grid"><tbody><tr><td i="header" class="ui-dialog-header" style="display: none;"><button i="close" class="ui-dialog-close" title="cancel">&times;</button><div i="title" class="ui-dialog-title" id="title:1509526661230"></div></td></tr><tr><td i="body" class="ui-dialog-body"><div i="content" class="ui-dialog-content" id="content:1509526661230"><div class="dialog-msg"><img src="' + evt.target.result + '" style="width: 200px;height: 200px" /></div></div></td></tr><tr><td i="footer" class="ui-dialog-footer"><div i="statusbar" class="ui-dialog-statusbar" style="display: none;"></div><div i="button" class="ui-dialog-button"><button type="button" onclick="closeCQ()">取消</button><button type="button" id="submit" onclick="subform()">上传</button> </div></td></tr></tbody></table>',

                });
            }
            reader.readAsDataURL(file.files[0]);
        }
    }


    function closeCQ() {

        layer.close(index);
    }

    function subform() {
        var formData = new FormData($("#form")[0]);
        $.ajax({
            url: "<?php echo U('Setting/setimg');?>",
            type: 'POST',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data) {
                if (data.status == 1) {
                    $('.user-logo').attr("src", "" + data['filename']);

                    layer.msg(data.info, {
                        icon: 1
                    });

                    layer.close(index);
                }
                else {
                    layer.msg(data.info, {
                        icon: 2
                    });
                }
            },
            error: function (data) {
                layer.msg(data.info, {
                    icon: 2
                });
            }
        });
    }

    function submitIntro() {
        var intro = $('[name=intro]').val();
        if (intro == '') {
            return false;
        }
        else if (intro.length > 200) {
            layer.msg('不得超过200个字', {
                icon: 2
            });
        }
        else {
            $.post('<?php echo U("Setting/userinfo");?>', {intro: intro}, function (data) {
                if (data.status == 1) {
                    layer.msg(data.info, {
                        icon: 1
                    });
                }
                else {
                    layer.msg(data.info, {
                        icon: 2
                    });
                }
            });
        }
    }


</script>