  if ('addEventListener' in document) {  
            document.addEventListener('DOMContentLoaded', function() {  
                FastClick.attach(document.body);  
            }, false);  
        }
        $(function() {  
            FastClick.attach(document.body);  
        }); 
$('.tab').on('click',function(){
	$(this).find('.more-item').toggle()
})
 $('.item-my').css('width',$('.last-item').css('width'))
 $('.my-panel .last-item').on('click',function(){
 	console.log(1)
 	$(this).find('.item-my').toggle()
 })