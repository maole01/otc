

function issetChile(obj){
	if(obj.children){
		return true;
	}else{
		return false;
	}
}

function autoWidth(obj = null){
	var width = 0;
	if(obj === null){
		obj = $('.jq-autoWidth');
	}
	var c = obj.children();
	$.each(c,function(){
		var w = 0;
		w = parseFloat($(this).outerWidth(true));
		width += w;
	});
	obj.width(width);
}
autoWidth();


function navTriangle(){
	var lobj = $('#nav-triangle').children('.logo');
	var mobj = $('#nav-triangle').children('.menu');
	lobj.css('width','80%');
	var width = lobj.width();
	lobj.css('width','0px');
	width = width / 2;
	lobj.css('borderLeft',width + 'px solid transparent');
	lobj.css('borderRight',width + 'px solid transparent');
	
}
navTriangle();

$('div#nav-auto').children().width(function(){
	var width = 0;
	var c = $(this).children();
	$.each(c,function(){
		width += parseFloat($(this).outerWidth(true)) + 2;
	});
	return width;
});
$('div#nav-auto').children('div').children('ul').children('li').click(function(){
	$(this).parent().parent().children().children('.index').removeClass('index');
	
	$(this).addClass('index');
});
function JqUl2Display(){
	$('.jq-ul2-display').children('li').css('float','left')
	$('.jq-ul2-display').children('li').width(function(){
		var obj = $(this).parent();
		var width = obj.width();
		var pl = obj.css('paddingLeft');
		var pr = obj.css('paddingRight');
		width = (parseFloat(width) - parseFloat(pl) - parseFloat(pr)) / 2;
		width = (width - ($(this).outerWidth(true) - $(this).width())) - 2;
		return width;
	});
	$('.jq-ul2-display').children('li').height(function(){
		var index = $(this).index();
		if(((parseInt(index) + 1) % 2) == 0){
			var height = $(this).prev().height();
			return height;
		}
	});
	$('.jq-ul2-display').height(function(){
		var height = 0;
		var c = $(this).children();
		$.each(c,function(){
			var index = $(this).index();
			if(((parseInt(index)) % 2) == 0){
				height += parseFloat($(this).outerHeight());
			}
		})
		return height;
	});
}
JqUl2Display();


function JqUl3Display(){
	$('.jq-ul3-display').children('li').css('float','left');
	$('.jq-ul3-display').children('li').width(function(){
		var obj = $(this).parent();
		var width = obj.width();
		var pl = obj.css('paddingLeft');
		var pr = obj.css('paddingRight');
		width = (parseFloat(width) - parseFloat(pl) - parseFloat(pr)) / 3;
		width = (width - ($(this).outerWidth(true) - $(this).width())) - 2;
		return width;
	});
	$('.jq-ul3-display').children('li').height(function(){
		var index = $(this).index();
		if(((parseInt(index) + 3) % 3) != 0){
			var height = $(this).prev().height();
			return height;
		}
	});
	$('.jq-ul3-display').height(function(){
		var height = 0;
		var c = $(this).children();
		$.each(c,function(){
			var index = $(this).index();
			if(((parseInt(index)) % 3) == 0){
				height += parseFloat($(this).outerHeight());
			}
		})
		return height;
	});
}
JqUl3Display();

function JqUl4Display(){
	$('.jq-ul4-display').children('li').css('float','left')
	$('.jq-ul4-display').children('li').width(function(){
		var obj = $(this).parent();
		var width = obj.width();
		var pl = obj.css('paddingLeft');
		var pr = obj.css('paddingRight');
		width = (parseFloat(width) - parseFloat(pl) - parseFloat(pr)) / 4;
		width = (width - ($(this).outerWidth(true) - $(this).width())) - 2;
		return width;
	});
	$('.jq-ul4-display').children('li').height(function(){
		var index = $(this).index();
		if(((parseInt(index) + 4) % 4) != 0){
			var height = $(this).prev().height();
			return height;
		}
	});
	$('.jq-ul4-display').height(function(){
		var height = 0;
		var c = $(this).children();
		$.each(c,function(){
			var index = $(this).index();
			if(((parseInt(index)) % 4) == 0){
				height += parseFloat($(this).outerHeight());
			}
		})
		return height;
	});
}
JqUl4Display();

function jqUl6Display(){
	$('.jq-ul6-display').children('li').css('float','left')
	$('.jq-ul6-display').children('li').width(function(){
		var obj = $(this).parent();
		var width = obj.width();
		var pl = obj.css('paddingLeft');
		var pr = obj.css('paddingRight');
		width = (parseFloat(width) - parseFloat(pl) - parseFloat(pr)) / 6;
		width = (width - ($(this).outerWidth(true) - $(this).width()));
		return width;
	});
	$('.jq-ul6-display').children('li').height(function(){
		var index = $(this).index();
		if(((parseInt(index) + 6) % 6) != 0){
			var height = $(this).prev().height();
			return height;
		}
	});
	$('.jq-ul6-display').height(function(){
		var height = 0;
		var c = $(this).children();
		$.each(c,function(){
			var index = $(this).index();
			if(((parseInt(index)) % 6) == 0){
				height += parseFloat($(this).outerHeight());
			}
		})
		return height;
	});
}
jqUl6Display();

function listRepeatYAction(){
	var obj = $('.list-repeat-y');
	$.each(obj,function(){
		var h = $(this).height();
		var lh = 0;
		var len = $(this).children().length;
		$.each($(this).children(),function(){
			lh += $(this).outerHeight(true);
		})
		h = (h - lh) / len / 2;
		$(this).children().css('paddingTop',h);
		$(this).children().css('paddingBottom',h);
	})
}
listRepeatYAction();

function listRepeatAction(){
	var obj = $('.list-repeat');
	$.each(obj,function(){
		
		if(!$(this).attr('style') || $(this).attr('style').indexOf('width') ==  -1){
			$(this).width(function(){
				autoWidth($(this));
			});
		}else{
			var w =$(this).width();
			var totalW = 0;
			$.each($(this).children(),function(){
				totalW += parseFloat($(this).outerWidth(true));
			});
			var len = $(this).children().length;
			var lw = (w - totalW) / len / 2 ;
			$(this).children().css('marginLeft',lw);
			$(this).children().css('marginRight',lw);
		}
		
	})
	obj.children().click(function(){
		$(this).parent().children().removeClass('index');
		$(this).addClass('index');
	});
}
listRepeatAction();

function div1Action(){
	var obj = $('.div1');
	obj.css('position','relative');
	$.each(obj,function(){
		var href = $(this).attr('href');
		var html = $(this).children('img')[0].outerHTML;
		html = '<a href="' + href + '"><div>' + html + html + '</div></a><div></div>';
		$(this).html(html);
		var lobj = $(this).children().last();
		var fobj = $(this).children().first().children();
		fobj.addClass('divImg');
		fobj.css('position','absolute');
		fobj.css('top','-166px');
		fobj.css('zIndex','3');
		fobj.children('img').css('width','140px');
		fobj.children('img').css('height','66px');
		fobj.children('img').css('padding','50px');
		lobj.addClass('div1background');
	});
	$('div.divImg').hover(function(){
		$(this).stop().animate({top:'0px'},300);
	},function(){
		$(this).stop().animate({top:'-166px'},300);
	});
}
div1Action();

function div3Action(){
	var obj = $('.div3');
	$.each(obj,function(){
		$(this).children().eq(2).html(function(){
			var t = $(this).text().substr(0,30);
			var opsition = t.indexOf('。');
			if(opsition == -1){
				opsition = 28;
				t = t.substr(0,opsition) + '<font class="lFont">...</font>';
			}else{
				t = t.substr(0,opsition) + '<font class="lFont">。</font>';
			}
			str = '<font class="d-n">' + $(this).text().substr(opsition) + '</font>';
			str = t + str;
			return str;
		});
	});
	$('.div3').hover(function(){
		$(this).attr('p',$(this).css('position'));
		$(this).css('position','relative');
		var html = $(this)[0].outerHTML;
		$(this).append(html);
		$(this).children().last().addClass('div3lDiv');
		var h = ($(this).height() + 100);
		var obj = $(this).children('.div3lDiv');
		obj.css('background','#fff');
		obj.css('position','absolute');
		obj.css('left','-1px');
		obj.css('top','0px');
		obj.css('borderTop','1px solid #eaeaea');
		obj.css('borderLeft','1px solid #e0e0e0');
		obj.css('borderRight','1px solid #555');
		obj.css('borderBottom','1px solid #666');
		obj.css('borderRadius','8px 8px 0px 0px');
		obj.css('boxShadow','5px 5px 10px #777');
		obj.css('top','0px');
		obj.animate({top:'-100px',height: h + 'px'},500);
		setTimeout(function(){
			obj.animate({borderBottomRightRadius:'8px',borderBottomLeftRadius:'8px'},300);
		},300);
	},function(){
		$(this).css('position',$(this).attr('p'));
		$(this).children('.div3lDiv').remove();
	});
}

div3Action();

function div4Action(){
	$('div.div4').hover(function(){
		var t = $(this).children('p').text();
		$(this).children('p').addClass('d-n');
		var lh = (parseFloat($(this).children('p').css('lineHeight')) / 2) + 20;
		var h = $(this).outerHeight();
		var w = $(this).outerWidth();
		
		var len = Math.sqrt((h * h) + (w * w));
		$(this).attr('p',$(this).css('position'));
		$(this).css('position','relative');
		var html = 	'<div class="div4backdiplay" style="position:absolute;top:0px;z-index:3;width:' + w + 'px;height:' + h + 'px;overflow:hidden;">'+
					'<p>' + t + '</p>'+
					'<img class="div4backdiplayImg" src="./Image/logoBackground.jpg" style="position:absolute;top:-' + ( (len - h) / 2 ) + 'px;left:-' + ( (len - w) / 2 ) + 'px;z-index:2;width:' + len + 'px;"/>'+
					'</div>';
		$(this).append(html);
		var lDiv = $(this).children('.div4backdiplay');
		var num = 20;
		var endNum = 360;
		var r = endNum / num;
		var i = 1;
		var timeNum = 500;
		var l = setInterval(function(){
			var rotate = i * r;
			i++;
			if(rotate >= endNum){
				rotate = endNum;
				clearInterval(l);
			}
			lDiv.css('transform','rotate(' + rotate + 'deg)');
		},(timeNum / num));
		var lImg = lDiv.children('.div4backdiplayImg');
		lImg.animate({opacity:'0.2'},1000);
	},function(){
		$(this).children('p').removeClass('d-n');
		$(this).css('position',$(this).attr('p'));
		$(this).children('.div4backdiplay').remove();
	});
}
div4Action();

function divBC1Action(){
	$('div.divBC1').hover(function(){
		// #202020
		$(this).attr('p',$(this).css('position'));
		$(this).css('position','relative');
		var h = $(this).height();
		var w = $(this).innerWidth();
		var pl = parseFloat($(this).css('paddingLeft'));
		var pr = parseFloat($(this).css('paddingRight'));
		$(this).append('<div style="position:absolute;top:0px;z-index:2;widht:0px;border:0px solid #fff;border-top-color:transparent;opacity :0.1;"></div>');
		$(this).children().last().addClass('lBackDivBL');
		var BLobj = $(this).children('.lBackDivBL');
		$(this).append('<div style="position:absolute;top:0px;z-index:2;widht:0px;border:0px solid #fff;border-left-color:transparent;opacity :0.1;"></div>');
		$(this).children().last().addClass('lBackDivTR');
		var TRobj = $(this).children('.lBackDivTR');
		BLobj.css('top',h);
		BLobj.css('left','0px');
		TRobj.css('left',w);
		BLobj.animate({borderLeftWidth: w + 'px',borderTopWidth: h + 'px',top:'0px'},500);
		TRobj.animate({borderLeftWidth: w + 'px',borderTopWidth: h + 'px',left:'0px'},500);
	},function(){
		$(this).css('position',$(this).attr('p'));
		$(this).children('.lBackDivTR').remove();
		$(this).children('.lBackDivBL').remove();
	});
}
divBC1Action();

$(window).scroll(function(event){
	
});
//	监听事件	---	 窗口变化
$(window).resize(function(){
	JqUl2Display();
	JqUl3Display();
	JqUl4Display();
	jqUl6Display();
	listRepeatYAction();
	navTriangle();
});