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
    <div class="setting-title">身份验证</div>
    <div class="setting-panel">
        <div class="tips-area">
            <span class="icon-warning-1"></span>

            为确保交易安全，保障您的合法权益，请您完成身份验证！我们提供安全高效实时联网的官方身份认证服务，具有更高级别的安全保护。身份验证一旦成功，不予修改和解除认证。建议您谨慎选择，真实填写。

        </div>
        <div class="real-name-cont">
            <div class="head">
                <div class="expand">
                    <span class="text-expand">展开</span><span class="text-close">收起</span><span class="icon-expand"></span>
                </div>
                <span class="icon-id-card "></span>
                <div class="head-title">
                    <div class="title-1">中国大陆身份证
                        <?php echo ($userinfo['idcard']?'<span class="status-tag">已验证</span>':'<span class="status-tag">未验证</span>'); ?>
                    </div>
                    <div class="decs">适用于大多数中国大陆用户</div>
                </div>
            </div>
            <div class="content normal-form form-cont clear-float">
                <div class="form-item input-cont">
                    <div class="input-name">姓名:</div>
                    <input type="text" validate check-type="real_name" name="real_name" id="name" class="input" placeholder="请输入真实姓名" value="<?php echo ($userinfo['truename']); ?>" <?php echo ($userinfo['idcard']?'disabled':''); ?>>
                    <div class="form-tips"></div>
                    <div class="error-msg">请输入真实姓名</div>
                </div>

                <div class="form-item input-cont">
                    <div class="input-name">身份证号码:</div>
                    <input type="text" validate check-type="id_card" name="number" id="cardnum" class="input" placeholder="请输入身份证号码" value="<?php echo ($userinfo['idcard']); ?>"  <?php echo ($userinfo['idcard']?'disabled':''); ?>>
                    <div class="form-tips"></div>
                    <div class="error-msg">请输入正确的身份证号码，15位或18位</div>
                </div> 
				<div class="form-item input-cont">
                    <div class="input-name">银行卡号:</div>
                    <input type="text" validate check-type="id_card" name="number" id="bankcard" class="input" placeholder="请输入银行号码" value="<?php echo ($userinfo['idcard']); ?>"  <?php echo ($userinfo['idcard']?'disabled':''); ?>>
                    <div class="form-tips"></div>
                    <div class="error-msg">请输入正确的银行卡号码。</div>
                </div>
                <?php echo ($userinfo['idcard']?'':'<a class="btn submit" onclick="checkCard()">确定</a>'); ?>



            </div>

        </div>
    </div>
</div>
<div class="dialog" id="success" style="display: none;">
    <div class="dialog-msg">实名认证设置成功</div>
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
    $('.expand').click(function(){
        if($('.real-name-cont').hasClass("current")){
            $('.real-name-cont').removeClass('current');
        }else{
            $('.real-name-cont').addClass('current');
        }
    });

    var vcity={ 11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",
        21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",
        33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",
        42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",
        51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",
        63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"
    };

    checkCard = function()
    {	var bankcard = $('#bankcard').value;
		if(!isCardNo(bankcard)){
			layer.msg('请输入正确的银行卡号码。', {
                icon: 2
            });
            document.getElementById('cardnum').focus();
            return false;
		}
        var truename=document.getElementById("name").value;
        var reg = /^[\u4e00-\u9fa5]{2,4}$/i;
        if (!reg.test(truename)) {
            layer.msg("请输入真实姓名，只能是2-4个汉字！", {
                icon: 2
            });
            document.getElementById('name').focus();
            return false;
        }
        else{
            var card = document.getElementById('cardnum').value;
            //是否为空
            if(card === '')
            {
                layer.msg('请输入正确的身份证号码，15位或18位', {
                    icon: 2
                });
                document.getElementById('cardnum').focus();
                return false;
            }
            //校验长度，类型
            if(isCardNo(card) === false)
            {
                layer.msg('请输入正确的身份证号码，15位或18位', {
                    icon: 2
                });
                document.getElementById('cardnum').focus();
                return false;
            }
            //检查省份
            if(checkProvince(card) === false)
            {
                layer.msg('请输入正确的身份证号码，15位或18位', {
                    icon: 2
                });
                document.getElementById('cardnum').focus();
                return false;
            }
            //校验生日
            if(checkBirthday(card) === false)
            {
                layer.msg('请输入正确的身份证号码，15位或18位', {
                    icon: 2
                });
                document.getElementById('cardnum').focus();
                return false;
            }
            //检验位的检测
            if(checkParity(card) === false)
            {
                layer.msg('请输入正确的身份证号码，15位或18位', {
                    icon: 2
                });
                document.getElementById('cardnum').focus();
                return false;
            }
            var real_name=$("#name").val();
            var number=$('#cardnum').val();
            $.post("<?php echo U('Setting/verification');?>",{real_name:real_name,number:number},function(data){
                if (data.status == 1) {
                    layer.msg(data.info, {
                        icon: 1,
                    },function () {
                       location.href="<?php echo U('Setting/verification');?>";
                    });
                } else {
                    layer.msg(data.info, {
                        icon: 2
                    });
                }
            });
        }

    };


    //检查号码是否符合规范，包括长度，类型
    isCardNo = function(card)
    {
        //身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
        var reg = /(^\d{15}$)|(^\d{17}(\d|X)$)/;
        if(reg.test(card) === false)
        {
            return false;
        }

        return true;
    };

    //取身份证前两位,校验省份
    checkProvince = function(card)
    {
        var province = card.substr(0,2);
        if(vcity[province] == undefined)
        {
            return false;
        }
        return true;
    };

    //检查生日是否正确
    checkBirthday = function(card)
    {
        var len = card.length;
        //身份证15位时，次序为省（3位）市（3位）年（2位）月（2位）日（2位）校验位（3位），皆为数字
        if(len == '15')
        {
            var re_fifteen = /^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/;
            var arr_data = card.match(re_fifteen);
            var year = arr_data[2];
            var month = arr_data[3];
            var day = arr_data[4];
            var birthday = new Date('19'+year+'/'+month+'/'+day);
            return verifyBirthday('19'+year,month,day,birthday);
        }
        //身份证18位时，次序为省（3位）市（3位）年（4位）月（2位）日（2位）校验位（4位），校验位末尾可能为X
        if(len == '18')
        {
            var re_eighteen = /^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/;
            var arr_data = card.match(re_eighteen);
            var year = arr_data[2];
            var month = arr_data[3];
            var day = arr_data[4];
            var birthday = new Date(year+'/'+month+'/'+day);
            return verifyBirthday(year,month,day,birthday);
        }
        return false;
    };

    //校验日期
    verifyBirthday = function(year,month,day,birthday)
    {
        var now = new Date();
        var now_year = now.getFullYear();
        //年月日是否合理
        if(birthday.getFullYear() == year && (birthday.getMonth() + 1) == month && birthday.getDate() == day)
        {
            //判断年份的范围（3岁到100岁之间)
            var time = now_year - year;
            if(time >= 3 && time <= 100)
            {
                return true;
            }
            return false;
        }
        return false;
    };
	
	/**
	 * 银行卡验证
	 * @param {*string} str
	 */
	function isBankCard(str) {
		var regex = /^(998801|998802|622525|622526|435744|435745|483536|528020|526855|622156|622155|356869|531659|622157|627066|627067|627068|627069)\d{10}$/;
		if (regex.test(str)) {
			return true;
		}
		return false;
	}
	
    //校验位的检测
    checkParity = function(card)
    {
        //15位转18位
        card = changeFivteenToEighteen(card);
        var len = card.length;
        if(len == '18')
        {
            var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
            var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
            var cardTemp = 0, i, valnum;
            for(i = 0; i < 17; i ++)
            {
                cardTemp += card.substr(i, 1) * arrInt[i];
            }
            valnum = arrCh[cardTemp % 11];
            if (valnum == card.substr(17, 1))
            {
                return true;
            }
            return false;
        }
        return false;
    };

    //15位转18位身份证号
    changeFivteenToEighteen = function(card)
    {
        if(card.length == '15')
        {
            var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
            var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
            var cardTemp = 0, i;
            card = card.substr(0, 6) + '19' + card.substr(6, card.length - 6);
            for(i = 0; i < 17; i ++)
            {
                cardTemp += card.substr(i, 1) * arrInt[i];
            }
            card += arrCh[cardTemp % 11];
            return card;
        }
        return card;
    };
</script>