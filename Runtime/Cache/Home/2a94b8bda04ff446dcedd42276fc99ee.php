<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <title>一个自由买卖安全可信赖的交易平台</title>
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
    <script src="http://cdn.ronghub.com/RongIMLib-2.2.9.min.js"></script>
	<style>
		.divA{float:left;width:260px;height:330px;font-size:14px;text-align:center;margin:2% 1%;background:#fff;border:1px solid #ccc;}
		.divA>div:nth-child(1){color:#fff;background:url(/Public/static/imgs/background.png) 0px 0px no-repeat;background-size:260px 134px;height:134px;}
		.divA>div:nth-child(1)>div:nth-child(1){margin:auto;padding-top:14px;width:50px;height:64px;}
		.divA>div:nth-child(1)>div:nth-child(1)>img{width:100%;height:100%;border-radius:50%;}
		.divA>div:nth-child(1)>ul:nth-child(2){height:44px;width:80%;margin:20px auto 0px;font-size:13px;}
		.divA>div:nth-child(1)>ul:nth-child(2)>li{float:left;height:40px;width:30%;margin: 0px 1.5%;}
		.divA>div:nth-child(2){color:#989898;}
		.divA>div:nth-child(2)>div:nth-child(1){font-size:20px;width:40%;border-bottom:2px solid #dfdfdf;line-height:40px;margin:0px auto 14px;}
		.divA>div:nth-child(2)>p:nth-child(4){margin-bottom:14px;}
		.divA>div:nth-child(2)>a:nth-child(5)>div{font-size:16px;font-weight:600;line-height:32px;color:#fff;height:32px;width:60px;background:#3fa3FD;margin:auto;border-radius:4px;}
	</style>
</head>
<body class="zh-CN">
<div class="header zh-CN" style="background: none;box-shadow: 0 0 0 #000;margin-bottom: 0;background: #fff;">
    <div class="header-box container clear-float">
        <div class="logo-wrap">
            <img src="/Public/static/imgs/logo.png">
        </div>
        <div class="nav fl">
            <ul>
                <li><a class="nav-item " href="<?php echo U('Index/index');?>" >首页</a><li>
                <li><a href="/Buy" class="nav-item">购买</a></li>
                <li><a href="/Sell" class="nav-item " >出售</a></li>
                <li><a class="nav-item " href="/Newad" >发布买卖</a></li>
                <li><a class="nav-item" href="<?php echo U('Activities/index');?>">邀请好友</a></li>
                <li style="background:url(/Public/static/imgs/qq_ico1png.png) 0px 2px no-repeat;background-size:20px;">
					<a class="nav-item" style="padding:10px 26px;" target="_blank" href="#">
						担保群
					</a>
				</li>
                <li style="background:url(/Public/static/imgs/qq_ico2png.png) 0px 10px no-repeat;background-size:20px;">
					<a class="nav-item" style="padding:10px 26px;" target="_blank" href="#">
						担保Q
					</a>
				</li>

            </ul>
        </div>
        <div class="clear-float fr login-panel" <?php if(!empty($sessioninfo["userid"])): ?>style="display:none"<?php endif; ?>>
        <a class="user-action" href="/Signup/phone"><span class="sp iconfont">&#xe6c9;</span><span class="va-middle">注册</span></a>
        <a class="user-action btn-login" href="/login/phone" ><span class="sp iconfont">&#xe6c9;</span><span class="va-middle">登录</span></a>
    </div>
    <div class="clear-float fr my-panel" <?php if(empty($sessioninfo["userid"])): ?>style="display:none"<?php endif; ?>>
    <div  class="item">
        <a href="<?php echo U('Order/lists');?>" class="item-label" id="orderPrompt"><span class="iconfont">&#xe613;</span> <span>订单</span> <span class="message-count" style="display: none"></span> <!-- <span class="iconfont arrow">&#xe601;</span> --></a>
        <div class="item-more item-message"></div>
    </div>
    <div class="item" >
        <a href="<?php echo U('Wallet/deposit',array('type'=>wkc));?>" class="item-label">
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
">总资产</div>
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
                        <div class="text BTC_available">WKC</div>
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
    <div class="item last-item" >
        <a href="javascript:void(0)" class="item-label"><span class="iconfont">&#xe6c9;</span> <span class="username"><?php echo ($sessioninfo["username"]); ?></span> <span class="iconfont arrow">&#xe601;</span></a>
        <div class="item-more item-my">
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
<div class="swiper-container">
    <div class="swiper-wrapper">
        <div class="swiper-slide banner1 ta-c" style="color:#fff;">
			<p style="font-weight:700;font-size:68px;margin-top:6%;text-align:left;padding-left:10%;"> Otc.9d.com</p>
			<p style="font-size:60px;">安全&nbsp;快捷&nbsp;值得信赖的国际 OTC 场外交易平台</p>

        </div>
        <div class="swiper-slide banner2 ta-c">
            <div class="h1"><strong>邀请好友</strong>坐享返现</div>
            <div class="decs">好友完成注册即可得</div>
            <a href="../login/phone-backto=-activities-invite.htm" >立即邀请</a>
        </div>
    </div>
    <div class="swiper-pagination"></div>
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
        }});
	var getUnreadCount = RongIMClient.getInstance().getUnreadCount;


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
            // 判断消息类型
            switch(message.messageType){
                case RongIMClient.MessageType.TextMessage:
                    // message.content.content => 消息内容
                    break;
                case RongIMClient.MessageType.VoiceMessage:
                    // 对声音进行预加载
                    // message.content.content 格式为 AMR 格式的 base64 码
                    break;
                case RongIMClient.MessageType.ImageMessage:
                    // message.content.content => 图片缩略图 base64。
                    // message.content.imageUri => 原图 URL。
                    break;
                case RongIMClient.MessageType.DiscussionNotificationMessage:
                    // message.content.extension => 讨论组中的人员。
                    break;
                case RongIMClient.MessageType.LocationMessage:
                    // message.content.latiude => 纬度。
                    // message.content.longitude => 经度。
                    // message.content.content => 位置图片 base64。
                    break;
                case RongIMClient.MessageType.RichContentMessage:
                    // message.content.content => 文本消息内容。
                    // message.content.imageUri => 图片 base64。
                    // message.content.url => 原图 URL。
                    break;
                case RongIMClient.MessageType.InformationNotificationMessage:
                    // do something...
                    break;
                case RongIMClient.MessageType.ContactNotificationMessage:
                    // do something...
                    break;
                case RongIMClient.MessageType.ProfileNotificationMessage:
                    // do something...
                    break;
                case RongIMClient.MessageType.CommandNotificationMessage:
                    // do something...
                    break;
                case RongIMClient.MessageType.CommandMessage:
                    // do something...
                    break;
                case RongIMClient.MessageType.UnknownMessage:
                    // do something...
                    break;
                default:
                // do something...
            }
        }
    });
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
<div style="position:relative;width:100%;height:40px;margin:10px auto 30px;">
	<div class="background" style="position:absolute;top:0px;background:#2e1e1f;opacity:0.1;width:100%;height:100%;"></div>
	<div style="width:70%;padding:4px;margin:auto;height:40px;">
		...
	</div>
</div>
<div class="item-box container">
    <div class="trade-info clearfix" style="margin-bottom:6px;">
        <h4 class="fl">交易信息</h4>
        <span class="fl service-time">7x24小时不间断服务</span>
		<h4 class="fl" style="margin-left:14%;">双向交易&nbsp;买卖自由&nbsp;安全可靠</h4>
    </div>
	<div style="margin:auto;width:13%;"><a href="<?php echo U('Buy/index');?>" style="background:linear-gradient(#45C3FD,#3fa3FD);padding:4px 20px;font-size:15px;color:#fff;border-radius:4px;">更多交易&gt;&gt;&gt;</a></div>

    <div class="cols mt-30">
        <div class="clear-float">
            <?php if(is_array($buyad)): foreach($buyad as $key=>$v): ?><div class="divA">
					<div>
						<div style="">
							<img src="<?php echo (getpic($v["userid"])); ?>"/>
						</div>
						<ul>
							<li>
								<p><?php echo (getjycs($v["userid"])); ?></p>
								<p>交易次数</p>
							</li>
							<li>
								<p><?php echo (getxrrs($v["userid"])); ?></p>
								<p>信任人数</p>
							</li>
							<li>
								<p><?php echo (gethpl($v["userid"])); ?>%</p>
								<p>好评度</p>
							</li>
						</ul>
					</div>
					<div>
						<div>购买</div>
						<p>交易价格:&nbsp; <span><?php echo ($v["price"]); ?></span>&nbsp;CNY</p>
						<p>交易限额:&nbsp;<?php echo ($v["min_amount"]); ?>-<?php echo ($v["max_amount"]); ?>&nbsp;CNY</p>
						<p>
						付款方式:&nbsp;<font>
                            <?php switch($v["provider"]): case "1": ?>银行转账<?php break;?>
                                <?php case "2": ?>支付宝<?php break;?>
                                <?php case "3": ?>微信支付<?php break;?>
                                <?php case "4": ?>其它<?php break; endswitch;?>
							</font>
						</p>
						<a href="<?php echo U('Addetail/index',array('adid'=>$v['id']));?>" class="btn"><div>购买</div></a>
					</div>
				</div><?php endforeach; endif; ?>
            <?php if(is_array($sellad)): foreach($sellad as $key=>$v): ?><div class="divA">
					<div>
						<div style="">
							<img src="<?php echo (getpic($v["userid"])); ?>"/>
						</div>
						<ul>
							<li>
								<p><?php echo (getjycs($v["userid"])); ?></p>
								<p>交易次数</p>
							</li>
							<li>
								<p><?php echo (getxrrs($v["userid"])); ?></p>
								<p>信任人数</p>
							</li>
							<li>
								<p><?php echo (gethpl($v["userid"])); ?>%</p>
								<p>好评度</p>
							</li>
						</ul>
					</div>
					<div>
						<div>出售</div>
						<p>交易价格:&nbsp; <span><?php echo ($v["price"]); ?></span>&nbsp;CNY</p>
						<p>交易限额:&nbsp;<?php echo ($v["min_amount"]); ?>-<?php echo ($v["max_amount"]); ?>&nbsp;CNY</p>
						<p>
						付款方式:&nbsp;<font>
                            <?php switch($v["provider"]): case "1": ?>银行转账<?php break;?>
                                <?php case "2": ?>支付宝<?php break;?>
                                <?php case "3": ?>微信支付<?php break;?>
                                <?php case "4": ?>其它<?php break; endswitch;?>
							</font>
						</p>
						<a href="<?php echo U('Addetail/index',array('adid'=>$v['id']));?>" class="btn"><div>出售</div></a>
					</div>
				</div><?php endforeach; endif; ?>
        </div>
    </div>
</div>

<div class="site-info">
    <div class="container cols clear-float">
        <div class="site-item">
            <img src="/Public/static/imgs/index/ico1.png">
            <div class="desc">本平台是一个独立的交易平台，自由买卖</div>
        </div>

        <div class="site-item">
            <img src="/Public/static/imgs/index/ico2.png">
            <div class="desc">专业金融安全级别重金多重安全防护</div>
        </div>

        <div class="site-item">
            <img src="/Public/static/imgs/index/ico3.png">
            <div class="desc">多信息迅速掌握，交易随时随地</div>
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