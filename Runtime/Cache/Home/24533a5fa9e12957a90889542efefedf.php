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


<link rel="stylesheet" href="/Public/static/css/wallet_a67d39a6b6.css">
<div class="container">
    <div class="currency-tabs">
        <a href="<?php echo U('Wallet/deposit',array('type'=>'wkc'));?>" class="tab <?php echo ($xnb==btc?'active':''); ?>">WKC</a>

    </div>
    <div class="panel">
        <div class="h3">钱包可用余额: <span class="link available"> <?php echo ($moneyinfo["$xnb"]); ?></span> <?php echo (strtoupper($xnb)); ?></div>
        <div class="wallet-view"><span class="s-text available">可用资产: <span class="link"><?php echo ($moneyinfo["$xnb"]); ?></span> <?php echo (strtoupper($xnb)); ?></span><span class="s-text locked">冻结资产: <span><?php echo ($moneyinfo["$xnbd"]); ?></span> <?php echo (strtoupper($xnb)); ?></span><span class="s-text total">总资产: <span class="link"><?php echo ($moneyinfo[$xnb]+$moneyinfo[$xnbd]); ?></span> <?php echo (strtoupper($xnb)); ?></span></div>
</div>
    <div class="tabs clear-float">
        <div class="tab get actived">接收 <?php echo (strtoupper($xnb)); ?></div>
        <div class="tab send ">发送 <?php echo (strtoupper($xnb)); ?></div>
    </div>

    <div class="panel clear-float">
        <div class="btc-get ">
            <div class="address">接收地址: <span><?php echo ($qianbao); ?></span><a class="icon-qrcode"></a>
            </div>
            <a id="codea"></a>
            <?php if($_GET['type'] == 'wkc'): ?><p><a class="btn zr">我已转入</a></p>
                <p>请使用您绑定链克钱包地址向<?php echo ($qianbao); ?>转帐,然后点击我已转入</p><?php endif; ?>
            <div class="tips-panel">温馨提示：在虚拟币网络接收虚拟币通常需要等待一段时间。我们会在收到虚拟币网络1个确认后给您入账。在平台内相互转账是实时到账且免费的。</div>
            <div class="panel-head">交易记录</div>
            <div class="transactions-panel">
                <table class="table">
                    <tr>
                        <td>时间</td>
                        <td>类型</td>
                        <td>金额</td>
                        <td>手续费</td>
                        <td>实际到账金额</td>
                        <td>状态</td>
                    </tr>
                    <?php if(is_array($myzr)): foreach($myzr as $key=>$v): ?><tr>
                            <td><?php echo (date('Y-m-d H:i:s',$v["addtime"])); ?></td>
                            <td>网络转入<?php echo (strtoupper($v["coinname"])); ?></td>
                            <td><?php echo ($v["num"]); ?></td>
                            <td><?php echo ($v["fee"]); ?></td>
                            <td><?php echo ($v["mum"]); ?></td>
                            <td>
                                <?php if(($v["status"]) == "1"): ?><font color="#23a800">转入成功 </font>

                                    <?php else: ?>

                                    正在处理<?php endif; ?>
                            </td>
                        </tr><?php endforeach; endif; ?>

                </table>


                <?php if(empty($myzr)): ?><div class="no-record">
                        <span class="icon-address-no-record"></span><span>暂无账户明细</span>
                    </div><?php endif; ?>
            </div>

        </div>
        <div class="btc-send  hidden">
            <div class="tips-panel">温馨提示：在<?php echo ($coin["title"]); ?>网络发送<?php echo ($coin["title"]); ?>，通常需要10分钟，<?php echo ($coin["title"]); ?>网络转账费为 <span class='block_chain_fee'><?php echo ($coin["zc_fee"]); ?>%</span>；我们会先审核后再广播到<?php echo ($coin["title"]); ?>网络，正在处理中代表平台正在审核中，处理完毕的您可以在交易明细中查看到转账详情。在平台内与用户之间的相互转账是实时到账且免费的。</div>

            <div class="normal-form form-cont clear-float">
                <div class="form-item input-cont">
                    <div class="input-name">发送地址: </div>
                    <input  type="text" name="address" validate check-type="address" class="input" placeholder="请输入正确的地址">
                    <div class="form-tips"></div>
                    <div class="error-msg">请输入正确的地址</div>
                </div>
                <div class="form-item input-cont">
                    <div id="reserve" style="display: none"></div>
                    <div class="input-name">数量: </div>
                    <input type="number" name="quantity" validate check-type="quantity" class="input" placeholder="发送数量，本次最多可发送 ">
                    <div class="form-tips"></div>
                    <div class="error-msg">请输入正确的数量，您最多发送</div>
                </div>
                <div class="form-item input-cont">
                    <div class="input-name" type="password">资金密码: </div>
                    <input type="text" name="password" validate check-type="password1" class="input" onfocus="this.type='password'" placeholder="请输入资金密码">
                    <div class="form-tips"></div>
                    <div class="error-msg"></div>
                </div>

                <?php if($ga != null): ?><div class="form-item input-cont">
                        <div class="input-name" type="ga">谷歌6位验证码: </div>
                        <input type="text" name="ga" validate check-type="ga" class="input" onfocus="this.type='ga'" placeholder="请输入谷歌6位密码">
                        <div class="form-tips"></div>
                        <div class="error-msg"></div>
                    </div><?php endif; ?>

                <div class="form-item input-cont">
                    <div class="input-name">备注: </div>
                    <input type="text" name="message" class="input">
                    <div class="form-tips"></div>
                    <div class="error-msg"></div>
                </div>

                <a  <?php echo ($coin['zc_jz']?'id="sendBtc"':''); ?> class="btn submit  <?php echo ($coin['zc_jz']?'':'disable'); ?>" ><?php echo ($coin['zc_jz']?'提交':'当前禁止转出'); ?></a>

            </div>
            <div class="panel-head">交易记录</div>
            <div class="panel transactions-panel">
                <table class="table table-hover">
                    <tr>
                       <td>时间</td>
                       <td>类型</td>
                       <td>金额</td>
                       <td>手续费</td>
                       <td>实际到账金额</td>
                       <td>状态</td>
                    </tr>
                    <?php if(is_array($myzc)): foreach($myzc as $key=>$v): ?><tr>
                            <td><?php echo (date('Y-m-d H:i:s',$v["addtime"])); ?></td>
                            <td>网络转出<?php echo (strtoupper($v["coinname"])); ?></td>
                            <td><?php echo ($v["num"]); ?></td>
                            <td><?php echo ($v["fee"]); ?></td>
                            <td><?php echo ($v["mum"]); ?></td>
                            <td>
                              <?php if(($v["status"]) == "1"): ?><font color="#23a800">转出成功 </font>

                                <?php else: ?>

                                正在处理<?php endif; ?>
                            </td>
                        </tr><?php endforeach; endif; ?>
                </table>
                <?php if(empty($myzc)): ?><div class="no-record">
                        <span class="icon-address-no-record"></span><span>暂无账户明细</span>
                    </div><?php endif; ?>
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

<script type="text/javascript" src="/Public/Home/js/jquery.qrcode.min.js"></script>
<script>
    function ck() {
        $.get("<?php echo U('Wallet/checkwkcpay');?>", function (data) {
            if (data.status == 1) {
                alert('充值成功！');
                window.location.reload();
            } else {
                setTimeout("ck()", 20000);
            }
        })
    }

    $('.zr').click(function () {
        layer.msg('支付确认中，预计30秒内完成', {icon: 16, time: 60000, shade: 0.5});
        ck();
    });
    $('.get').click(function () {
         $('.send').removeClass('actived');
         $('.btc-send').addClass('hidden');
        $('.get').addClass('actived');
        $('.btc-get').removeClass('hidden');
    });

    $('.send').click(function () {
        $('.get').removeClass('actived');
        $('.btc-get').addClass('hidden');
        $('.send').addClass('actived');
        $('.btc-send').removeClass('hidden');
    })


    $('#codea').qrcode({

        render: "table", //table方式

        width: 100, //宽度

        height: 100, //高度

        text: "<?php echo ($qianbao); ?>" //任意内容

    }); //任意字符串

    $('#sendBtc').click(function () {
         var address=$('[name=address]').val();
         var num=$('[name=quantity]').val();
         var password=$('[name=password]').val();
         var message=$('[name=message]').val();
         if(address==''){
             layer.msg('发送地址不能为空', {
                 icon: 2
             });
             return false;
         }
        if(num==''){
            layer.msg('数量不能为空', {
                icon: 2
            });
            return false;
        }
        if(!/^(\d|[1-9]\d+)(\.\d+)?$/.test(num)){
            layer.msg('数量不正确', {
                icon: 2
            });
            return false;
        }
        if(password==''){
            layer.msg('资金密码不能为空', {
                icon: 2
            });
            return false;
        }

        <?php if($ga != null): ?>var code=$('[name=ga]').val();
            if(code==''){
                layer.msg('谷歌验证码不能为空', {
                    icon: 2
                });
                return false;
            }<?php endif; ?>


        $.post('<?php echo U("Wallet/withdraw");?>',{
            address:address,
            num:num,
            password:password,
            message:message,
            coin:'<?php echo ($xnb); ?>',
            <?php if($ga != null): ?>code:code<?php endif; ?>
        },function (data) {
              if(data.status){
                  layer.load();
                  setTimeout(function(){
                      layer.closeAll('loading');
                      layer.msg(data.info, {
                          icon: 1
                      },function(){
                          location.reload();
                      });
                  }, 2000);

              } else {
                  layer.load();
                  setTimeout(function(){
                      layer.closeAll('loading');
                      layer.msg(data.info, {
                          icon: 2
                      });
                  }, 2000);

              }
        });

    });

        $('.filter a').click(function () {
            $('.filter a').removeClass('actived');
            $(this).addClass('actived');
            where=$(this).attr('type');
        })


</script>