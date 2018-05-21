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


<link rel="stylesheet" href="/Public/static/css/manage.css">
<div class="container clear-float">
    <div class="setting-leftmenu fl">
        <div class="menu-head">广告管理</div>
        <div class="menu-c">
            <div class="icon-fold"></div>
            <div class="menu-title">出售广告</div>
            <div class="menu-item-cont">
				<?php if(is_array($coinArr)): foreach($coinArr as $key=>$c): ?><a href="/manage/adsell/type/<?php echo (strtoupper($c['name'])); ?>" class="menu-item "><?php echo (strtoupper($c["name"])); ?></a><?php endforeach; endif; ?>
            </div>
        </div>
        <div class="menu-c bt">
            <div class="icon-fold"></div>
            <div class="menu-title">购买广告</div>
            <div class="menu-item-cont">
				<?php if(is_array($coinArr)): foreach($coinArr as $key=>$c): ?><a href="/manage/adbuy/type/<?php echo (strtoupper($c['name'])); ?>" class="menu-item "><?php echo (strtoupper($c["name"])); ?></a><?php endforeach; endif; ?>
            </div>
        </div>

    </div>
    <div class="fr adver-wrap">
        <div class="setting-title">
            出售广告 > <?php echo (strtoupper($coinname)); ?>
        </div>
        <div class="setting-panel">
            <div class="tabs">
                <span class="tab current" id="up">进行中</span><span class="tab" id="down">已下架</span>
            </div>
            <table class="table order" id="up_table" cellspacing="0" cellpadding="0">
                <thead>
                <tr class="order-head ">
                    <th class="pl-30">编号</th>
                    <th>广告类型</th>
                    <th class="td-country">国家</th>
                    <th>价格</th>
                    <th class="td-time">创建时间</th>
                    <th>状态</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
               <?php if(is_array($adsell)): foreach($adsell as $key=>$v): if($v["status"] == 1): ?><tr>
                        <td class="pl-30"><a href="<?php echo U('Manage/editad',array('adid'=>$v['id']));?>" class="link"><?php echo ($v["id"]); ?></a></td>
                        <td>出售 <?php echo (strtoupper($v["coin"])); ?></td>
                        <td class="td-country"><?php echo (strtoupper($v["country"])); ?></td>
                        <td><?php echo ($v["price"]); ?> <?php echo (strtoupper($v["currency"])); ?></td>
                        <td class="td-time"><?php echo (date('Y-m-d H:i:s',$v["addtime"])); ?></td>
                        <td class="red-text">进行中</td>
                        <td class="pr-30 ta-r"><a href="<?php echo U('Manage/editad',array('adid'=>$v['id']));?>" class="btn ">编辑</a><a class="btn ground" href="javascript:grounp(<?php echo ($v["id"]); ?>);">下架</a></td>
                    </tr><?php endif; endforeach; endif; ?>
                </tbody>
            </table>

            <table class="table order  hidden" id="down_table" cellspacing="0" cellpadding="0">
                <thead>
                <tr class="order-head ">
                    <th class="pl-30">编号</th>
                    <th>广告类型</th>
                    <th class="td-country">国家</th>
                    <th>价格</th>
                    <th class="td-time">创建时间</th>
                    <th>状态</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <?php if(is_array($adsell)): foreach($adsell as $key=>$v): if($v["status"] == 0): ?><tr>
                            <td class="pl-30"><a href="<?php echo U('Manage/editad',array('adid'=>$v['id']));?>" class="link"><?php echo ($v["id"]); ?></a></td>
                            <td>出售 <?php echo (strtoupper($v["coin"])); ?></td>
                            <td class="td-country"><?php echo (strtoupper($v["country"])); ?></td>
                            <td><?php echo ($v["price"]); ?> <?php echo (strtoupper($v["currency"])); ?></td>
                            <td class="td-time"><?php echo (date('Y-m-d H:i:s',$v["addtime"])); ?></td>
                            <td class="red-text">已下架</td>
                            <td class="pr-30 ta-r"><a href="<?php echo U('Manage/editad',array('adid'=>$v['id']));?>" class="btn ">编辑</a><a class="btn ground" href="javascript:grounp(<?php echo ($v["id"]); ?>);">重新上架</a></td>
                        </tr><?php endif; endforeach; endif; ?>
                </tbody>
            </table>

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


<script>
    $('#up').click(function () {
        $('#down').removeClass('current');
        $('#down_table').addClass('hidden');
        $('#up').addClass('current');
        $('#up_table').removeClass('hidden');
    })

    $('#down').click(function () {
        $('#up').removeClass('current');
        $('#up_table').addClass('hidden');
        $('#down').addClass('current');
        $('#down_table').removeClass('hidden');
    })

    function grounp(adid) {
        $.post('<?php echo U("Manage/showorhide");?>',{adid:adid},function (data) {
               if(data.status){
                   layer.alert(data.info,{icon: 1});
                   setTimeout("location.reload()",1000);
               } else {
                   layer.alert(data.info);
                   setTimeout("location.reload()",1000);
               }
        })
    }
</script>