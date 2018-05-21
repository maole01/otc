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


<link rel="stylesheet" href="/Public/static/css/order-list.css">
<div class="container order-container">
    <div class="page-title">订单管理</div>
    <div class="tabs clear-float mt-20">
        <a href="<?php echo U('Order/lists',array('type'=>'going'));?>" class="tab actived">进行中</a><span class="br"></span>
        <div class="tab ">
            <span class="down-arrow">已结束 </span>
            <div class="more-item">
                <a href="<?php echo U('Order/lists',array('type'=>'ending'));?>" class="item">BTC</a>
            </div>
        </div>
    </div>

    <div class="order-list">
        <div class="list-header clear-float mb-10">
            <span class="header-text width-1">交易伙伴</span>
            <span class="header-text width-2">订单编号</span>
            <span class="header-text width-3">类型</span>
            <span class="header-text width-4">交易金额</span>
            <span class="header-text width-5">交易数量</span>
            <span class="header-text width-6">创建时间</span>
            <span class="header-text width-7">交易状态</span>

        </div>

        <?php if(is_array($list)): foreach($list as $key=>$v): ?><div class="data-row clear-float" id="uid_<?php echo ($v["yjhb"]); ?>">
          <span class="width-1 data-text">
            <a class="link" href="<?php echo U('User/view',array('id'=>$v['yjhb']));?>"><img class="avatar" src="<?php echo ($v['ue_img']); ?>" alt=""></a>
            <a href="<?php echo U('User/view',array('id'=>$v['yjhb']));?>" class="username link"><?php echo ($v["username"]); ?></a>
          </span>
            <span class="width-2 data-text">
            <a href="<?php echo U('Order/detail',array('id'=>$v['id']));?>" class="link"><?php echo ($v["id"]); ?></a>
          </span>
            <span class="width-3 data-text">
                <?php if($v["buyid"] == $_SESSION['userid']): ?>购买
                 <?php else: ?>
                      出售<?php endif; ?>
               <?php echo (strtoupper($v["coin"])); ?></span>
            <span class="width-4 data-text"><?php echo ($v["amount"]); ?></span>
            <span class="width-5 data-text"><?php echo ($v["num"]); ?> <?php echo (strtoupper($v["coin"])); ?></span>
            <span class="width-6 data-text"><?php echo (date('Y-m-d H:i:s',$v["addtime"])); ?></span>
            <span class="width-7 data-text red-text">
                <?php switch($v["status"]): case "0": ?>未付款<?php break;?>
                        <?php case "1": ?>已付款<?php break;?>
                        <?php case "2": ?>已释放<?php break;?>
                        <?php case "3": ?>交易完成<?php break;?>
                        <?php case "4": ?>取消交易<?php break;?>
                        <?php case "5": ?>申诉中<?php break;?>
                        <?php case "6": ?>订单超时<?php break; endswitch;?>
            </span>
            <span class="width-7 data-text red-text"><a class="btn btn-comment" href="<?php echo U('Order/detail',array('id'=>$v['id']));?>">交易操作</a></span>
        </div><?php endforeach; endif; ?>


  </div>

    <div class="page1"><?php echo ($page); ?></div>
  </div>


</div>
<script>
	<?php
 foreach($_SESSION['target'] as $id => $t){ echo '$("#uid_'.$id.'").append("<span class='."'".'targetDiv'."'".'>'.$t.'条消息未读</span>").css("position","relative");'; } ?>
</script>
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