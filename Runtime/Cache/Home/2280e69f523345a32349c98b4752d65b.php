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


<link rel="stylesheet" href="/Public/static/css/ad-detail_ace1d7eae9.css">
<div class="container clear-float ad-detail">
    <div class="detail-left ">
        <div class="poster-info clear-float">
            <div class="fl head-sculpture">
                <a href="<?php echo U('User/view',array('id'=>$adinfo['userid']));?>"><img class="poster-head fl" src="<?php echo ($adinfo['ue_img']); ?>"  alt=""></a>
            </div>
            <div class="fl detail-bottom-wrap">
                <div class="user-name"><a href="<?php echo U('User/view',array('id'=>$adinfo['userid']));?>" ><?php echo ($adinfo['username']); ?></a><span style="display: none" class="icon-message" userid="<?php echo ($adinfo['userid']); ?>"></span></div>
                <div class="poster-info-cont clear-float">
                      <span class="poster-info-item">
                        <div class="item-d"><?php echo (getjycs($adinfo['userid'])); ?></div>
                        <div class="item-n">交易次数</div>
                      </span>
                                <span class="poster-info-item">
                        <div class="item-d"><?php echo (getxrrs($adinfo['userid'])); ?></div>
                        <div class="item-n">信任人数</div>
                      </span>
                                <span class="poster-info-item">
                        <div class="item-d"><?php echo (gethpl($adinfo['userid'])); ?>%</div>
                        <div class="item-n">好评度</div>
                      </span>
                                <span class="poster-info-item">
                        <div class="item-d"><?php echo (getcjsl($adinfo['userid'],$adinfo['coin'])); echo (strtoupper($adinfo["coin"])); ?></div>
                        <div class="item-n">历史成交</div>
                      </span>
                </div>
                <table class="table-info pt-30">
                    <tr>
                        <th>报价:</th><td></td><td class="price"><span><?php echo ($adinfo['price']); ?></span> <?php echo (strtoupper($adinfo['currency'])); ?>/<?php echo (strtoupper($adinfo['coin'])); ?></td>
                    </tr>
                    <tr>
                        <th>交易限额:</th><td></td><td><?php echo ($adinfo['min_amount']); ?>-<?php echo ($adinfo['max_amount']); ?> <?php echo (strtoupper($adinfo['currency'])); ?></td>
                    </tr>
                    <tr>
                        <th>付款方式:</th><td></td><?php switch($adinfo["provider"]): case "1": ?><td>银行转账</td><?php break;?>
                        <?php case "2": ?><td>支付宝</td><?php break;?>
                        <?php case "3": ?><td>微信支付</td><?php break;?>
                        <?php case "4": ?><td>其它</td><?php break; endswitch;?>
                    </tr>
                    <tr>
                        <th>付款期限:</th><td></td><td><?php echo ((isset($adinfo["paytime"]) && ($adinfo["paytime"] !== ""))?($adinfo["paytime"]):30); ?> 分钟</td>
                    </tr>
                    <?php if($adinfo['ad_type'] == 0): ?><tr>
                            <th>最大可购买:</th><td></td><td><?php echo ($adinfo[$adinfo['coin']]); ?> <?php echo (strtoupper($adinfo["coin"])); ?></td>
                        </tr><?php endif; ?>
                </table>
            </div>
           
        </div>

        

        <div class="form-cont ad-detail clear-float">
            <div class="form-title">


                <span class="form-name">你想<?php echo ($adinfo['ad_type']?'出售':'购买'); ?>多少？</span>


                <span class="form-name"></span>
            </div>
            <div class="input-cont input2 mr-12" >
                <input type="number" placeholder="输入您想购买的金额" class=" input " name="amount" >
                <div class="input-after">CNY</div>
            </div>
            <span class="icon-equal"></span>
            <div class="input-cont input2">
                <input type="number" placeholder="输入您想购买的数量" class="input" name="qty" >
                <div class="input-after"><?php echo (strtoupper($adinfo["coin"])); ?></div>
            </div>
            <?php if($_SESSION['userid']== $adinfo['userid']): elseif($_SESSION['userid']== null): ?>
            <a  style="" href="<?php echo U('Login/phone');?>"  class="btn submit">免费注册，立即购买<?php echo (strtoupper($adinfo["coin"])); ?></a>
            <?php elseif($adinfo["ad_type"] == 0): ?>
            <a  style=""  href="javascript:;" class="btn submit" id="order">立即购买</a>
            <?php elseif($adinfo["ad_type"] == 1): ?>
            <a  style="" href="javascript:;" class="btn submit" id="order">立即出售</a><?php endif; ?>
            <hr class="line-hr">

            <div class="form-title pt-30">
                <span class="form-name">交易须知</span>
            </div>
            
            <p class="p">1.交易前请详细了解对方的交易信息。<br>2.请通过平台进行沟通约定，并保存好相关聊天记录。<br>3.如遇到交易纠纷，可通过申诉来解决问题。<br>4.在您发起交易请求后，<?php echo (strtoupper($adinfo['coin'])); ?>被锁定在托管中，受到保护。如果您是买家，发起交易请求后，请在付款周期内付款并把交易标记为付款已完成。卖家在收到付款后将会放行处于托管中的<?php echo (strtoupper($adinfo['coin'])); ?>。<br>交易前请阅读《服务条款》以及常见问题、交易指南等帮助文档。<br>5.请注意欺诈风险，交易前请检查该用户收到的评价和相关信用信息，并对新近创建的账户多加留意。<br>6.托管服务保护网上交易的买卖双方。在发生争议的情况下，我们将评估所提供的所有信息，并将托管的<?php echo (strtoupper($adinfo['coin'])); ?>放行给其合法所有者。<br></p>
        </div>
    </div>
    <div class="detail-right">
        <div class="form-cont">
            <div class="form-title pt-30">
                <span class="form-name">广告留言</span>
            </div>
            <div class="line mt-20 mb-20"></div>
            <p class="p mb-20"><?php echo ($intro["content"]); ?></p>
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
    $('[name=amount]').keyup(function() {
        var amount = $('[name=amount]').val();
        if (! (/^[0-9]\d*(\.\d+)?$/.test(amount))) {
            return false
        }
        if (amount >= <?php echo ($adinfo['max_amount']); ?>) {
            amount = <?php echo ($adinfo['max_amount']); ?>;
            $('[name=amount]').val(amount)
        }
        var btcnum = amount / <?php echo ($adinfo['price']); ?>;
        btcnum = btcnum.toFixed(8);
        $('[name=qty]').val(btcnum)
    });
    $('[name=qty]').keyup(function() {
        var qty = $('[name=qty]').val();
        if (! (/^[0-9]\d*(\.\d+)?$/.test(qty))) {
            return false
        }
        var amount = qty * <?php echo ($adinfo['price']); ?>;
        amount = amount.toFixed(8);
        $('[name=amount]').val(amount)
    });
    $('#order').click(function() {
        var price = <?php echo ($adinfo["price"]); ?>;
        var amount = $('[name=amount]').val();
        var qty = $('[name=qty]').val();
        if (amount == '' || qty == '') {
            layer.msg('未填写');
            return false
        }
        if (!<?php echo ($adinfo["ad_type"]); ?>) {
            layer.confirm('<div><h2>下单确认</h2></div>' + '<div><p>购买价格: ' + price + ' CNY</p></div>' + '<div><p>购买金额: ' + amount + ' CNY</p></div>' + '<div><p>购买数量: ' + qty + ' <?php echo (strtoupper($adinfo["coin"])); ?></p></div>' + '<div><h1><font style="color: red">提醒：请确认价格再下单，下单后此交易的<?php echo (strtoupper($adinfo['coin'])); ?>将托管锁定，请放心购买。</font></h1></div>', {
                    btn: ['确定购买', '放弃购买']
                },
                function() {
                    if (<?php echo ($ga); ?>) {
                        layer.prompt({
                                title: '输入谷歌6位验证码',
                                formType: 0
                            },
                            function(pass, index) {
                                if (/^\d{6}$/.test(pass)) {
                                    $.post("<?php echo U('Addetail/gasubmit');?>", {
                                            code: pass
                                        },
                                        function(data) {
                                            if (data.status) {
                                                $.post('<?php echo U("Order/index");?>', {
                                                        adid: <?php echo ($adinfo['adid']); ?>,
                                                        ad_type: <?php echo ($adinfo['ad_type']); ?>,
                                                        price: price,
                                                        amount: amount,
                                                        qty: qty
                                                    },
                                                    function(data) {
                                                        if (data.status) {
                                                            location.href = data.url
                                                        } else {
                                                            layer.msg(data.info, {
                                                                icon: 2
                                                            })
                                                        }
                                                    })
                                            } else {
                                                layer.msg(data.info)
                                            }
                                        })
                                } else {
                                    layer.msg('输入的格式不正确')
                                }
                            })
                    } else {
                        $.post('<?php echo U("Order/index");?>', {
                                adid: <?php echo ($adinfo['adid']); ?>,
                                ad_type: <?php echo ($adinfo['ad_type']); ?>,
                                price: price,
                                amount: amount,
                                qty: qty
                            },
                            function(data) {
                                if (data.status) {
                                    location.href = data.url
                                } else {
                                    layer.msg(data.info, {
                                        icon: 2
                                    })
                                }
                            })
                    }
                })
        } else {
            layer.confirm('<div><h2>下单确认</h2></div>' + '<div><p>出售价格: ' + price + ' CNY</p></div>' + '<div><p>出售金额: ' + amount + ' CNY</p></div>' + '<div><p>出售数量: ' + qty + ' <?php echo (strtoupper($adinfo["coin"])); ?></p></div>' + '<div><h1><font style="color: red">提醒：请确认价格再下单，下单后此交易的<?php echo (strtoupper($adinfo['coin'])); ?>将托管锁定，请放心出售。</font></h1></div>', {
                    btn: ['确定出售', '放弃出售']
                },
                function() {
                    if (<?php echo ($ga); ?>) {
                        layer.prompt({
                                title: '输入谷歌6位验证码',
                                formType: 0
                            },
                            function(pass, index) {
                                if (/^\d{6}$/.test(pass)) {
                                    $.post("<?php echo U('Addetail/gasubmit');?>", {
                                            code: pass
                                        },
                                        function(data) {
                                            if (data.status) {
                                                $.post('<?php echo U("Order/index");?>', {
                                                        adid: <?php echo ($adinfo['adid']); ?>,
                                                        price: price,
                                                        ad_type: <?php echo ($adinfo['ad_type']); ?>,
                                                        amount: amount,
                                                        qty: qty
                                                    },
                                                    function(data) {
                                                        if (data.status) {
                                                            location.href = data.url
                                                        } else {
                                                            layer.msg(data.info, {
                                                                icon: 2
                                                            })
                                                        }
                                                    })
                                            } else {
                                                layer.msg(data.info)
                                            }
                                        })
                                } else {
                                    layer.msg('输入的格式不正确')
                                }
                            })
                    } else {
                        $.post('<?php echo U("Order/index");?>', {
                                adid: <?php echo ($adinfo['adid']); ?>,
                                price: price,
                                ad_type: <?php echo ($adinfo['ad_type']); ?>,
                                amount: amount,
                                qty: qty
                            },
                            function(data) {
                                if (data.status) {
                                    location.href = data.url
                                } else {
                                    layer.msg(data.info, {
                                        icon: 2
                                    })
                                }
                            })
                    }
                })
        }
    });
</script>