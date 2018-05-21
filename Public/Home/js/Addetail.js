$('[name=amount]').keyup(function () {
    var amount=$('[name=amount]').val();
    if(!(/^[0-9]\d*(\.\d+)?$/.test(amount))){
        return false;
    }
    if(amount>={$adinfo['max_amount']}){
        amount={$adinfo['max_amount']};
        $('[name=amount]').val(amount);
    }
    var btcnum=amount/{$adinfo['price']};
    btcnum=btcnum.toFixed(8);
    $('[name=qty]').val(btcnum);

});

$('[name=qty]').keyup(function () {
    var qty=$('[name=qty]').val();
    if(!(/^[0-9]\d*(\.\d+)?$/.test(qty))){
        return false;
    }
    var amount=qty*{$adinfo['price']};
    amount=amount.toFixed(8);
    $('[name=amount]').val(amount);
});

$('#order').click(function () {
    var price={$adinfo.price};
    var amount= $('[name=amount]').val();
    var qty=$('[name=qty]').val();
    if(amount=='' ||qty ==''){
        layer.msg('未填写');
        return false
    }

    if(!{$adinfo.ad_type}){
        layer.confirm('<div><h2>下单确认</h2></div>' +
            '<div><p>购买价格: '+price+' CNY</p></div>' +
            '<div><p>购买金额: '+amount+' CNY</p></div>' +
            '<div><p>购买数量: '+qty+' BTC</p></div>' +
            '<div><h1><font style="color: red">提醒：请确认价格再下单，下单后此交易的比特币将托管锁定，请放心购买。</font></h1></div>'
            ,{
                btn: ['确定购买','放弃购买'] //按钮
            }, function(){
                if({$ga}){

                    layer.prompt({title: '输入谷歌6位验证码', formType: 0}, function(pass, index){
                        if(/^\d{6}$/.test(pass)){
                            $.post("{:U('Addetail/gasubmit')}",{code:pass},function (data) {
                                if(data.status){
                                    $.post('{:U("Order/index")}',{
                                        adid:{$adinfo['adid']},
                                        ad_type:{$adinfo['ad_type']},
                                        price:price,
                                        amount:amount,
                                        qty:qty
                                    },function(data) {
                                        if(data.status){
                                            location.href=data.url;
                                        } else {
                                            layer.msg(data.info, {
                                                icon: 2
                                            });
                                        }
                                    });
                                } else {
                                    layer.msg(data.info);
                                }
                            })
                        } else {
                            layer.msg('输入的格式不正确');
                        }
                    });

                } else {
                    $.post('{:U("Order/index")}',{
                        adid:{$adinfo['adid']},
                        ad_type:{$adinfo['ad_type']},
                        price:price,
                        amount:amount,
                        qty:qty
                    },function(data) {
                        if(data.status){
                            location.href=data.url;
                        } else {
                            layer.msg(data.info, {
                                icon: 2
                            });
                        }
                    });
                }
            });
    } else {
        layer.confirm('<div><h2>下单确认</h2></div>' +
            '<div><p>出售价格: '+price+' CNY</p></div>' +
            '<div><p>出售金额: '+amount+' CNY</p></div>' +
            '<div><p>出售数量: '+qty+' BTC</p></div>' +
            '<div><h1><font style="color: red">提醒：请确认价格再下单，下单后此交易的比特币将托管锁定，请放心出售。</font></h1></div>'
            ,{
                btn: ['确定出售','放弃出售'] //按钮
            }, function(){
                if({$ga}){

                    layer.prompt({title: '输入谷歌6位验证码', formType: 0}, function(pass, index){
                        if(/^\d{6}$/.test(pass)){
                            $.post("{:U('Addetail/gasubmit')}",{code:pass},function (data) {
                                if(data.status){
                                    $.post('{:U("Order/index")}',{
                                        adid:{$adinfo['adid']},
                                        price:price,
                                        ad_type:{$adinfo['ad_type']},
                                        amount:amount,
                                        qty:qty
                                    },function (data) {
                                        if(data.status){
                                            location.href=data.url;
                                        } else {
                                            layer.msg(data.info, {
                                                icon: 2
                                            });
                                        }
                                    });
                                } else {
                                    layer.msg(data.info);
                                }
                            })
                        } else {
                            layer.msg('输入的格式不正确');
                        }
                    });

                } else {
                    $.post('{:U("Order/index")}',{
                        adid:{$adinfo['adid']},
                        price:price,
                        ad_type:{$adinfo['ad_type']},
                        amount:amount,
                        qty:qty
                    },function (data) {
                        if(data.status){
                            location.href=data.url;
                        } else {
                            layer.msg(data.info, {
                                icon: 2
                            });
                        }
                    });
                }

            });
    }

});
