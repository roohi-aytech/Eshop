var bheight = $(window).height();
$(document).ready(function(){	
       $('a.back-top-btn,.standalone_backtop').click(function(){
		$('body,html').animate({scrollTop:0}, 500);
		return false;
	});
		var menuref;
		 if(bheight < 500 ){
			if($('#cartheader').length > 0){$('#cartheader').css('max-height','220px');}
			if($('#toggle-search').length > 0){$('#toggle-search').css('max-height','220px');}
			if($('.notification_scroll').length > 0){$('.notification_scroll').css('max-height','220px');}
			$('.cat_scroll').css('max-height','185px');
		}else{
                    $('.cat_scroll,.notification_scroll,#cartheader,#toggle-search').css('max-height','');                 
                }

		/*$('.menuexpand').click(function(event){
			menuref = $(this).data('ref');
			$('body,html,#p_main_wrapper').css('overflow','hidden');
			if($('#'+menuref).is(':hidden')){
				if($('.menucollapse:visible').length == 0){
					$('#'+menuref).slideDown(200);
					$('#menu_overlay').fadeIn(150);
					$('#p_main_wrapper').css('height',bheight+'px');
				}else{
					$('.menucollapse:visible').slideUp(200,function(){
						$('#'+menuref).slideDown(200);
						$('#menu_overlay').fadeIn(150);
						$('#p_main_wrapper').css('height',bheight+'px');
					});
				}				
			}else{
				$('#'+menuref).slideUp(200);
				$('#menu_overlay').fadeOut(150);
				$('body,html,#p_main_wrapper').css('overflow','auto');
				$('#p_main_wrapper').css('height','');
			}
			event.preventDefault();
		});*/
		$('.menuexpand').click(function(event){
			menuref = $(this).data('ref');
			$('#'+menuref).show();
						
			//$('#menu_overlay').fadeIn(300);
			if($('.menuactive').length > 0){
				if($('#'+menuref).hasClass('menuactive')){
					$('#'+menuref).removeClass('menuactive');
					$('#'+menuref).transition({'top':'-500px'},400,'easeInOutQuart');
					$('#menu_overlay').delay(200).fadeOut(200);
					$('#p_main_wrapper').css('height','');
					$('body,html,#p_main_wrapper').css('overflow','auto');
                                        $('.menuexpand').removeClass('current_menu_item');
				}else{
                                        $('#menu_overlay').css('z-index',991).delay(200).fadeIn(200);
					$('.menuactive').transition({'top':'-500px'},250,'easeInOutQuart',function(){
                                            $('#'+menuref).transition({'top':67},250,'easeInOutQuart');
                                            $('.menucollapse').removeClass('menuactive');
                                            $('#'+menuref).addClass('menuactive');
					});					
					$('#p_main_wrapper').css('height',bheight+'px');
					$('body,html,#p_main_wrapper').css('overflow','hidden');
                                        $('.menuexpand').removeClass('current_menu_item');
                                        $(this).addClass('current_menu_item');
				}
			}else{
                                $('#menu_overlay').css('z-index',991).delay(200).fadeIn(200);
				$('#'+menuref).transition({'top':67}, 400,'easeInOutQuart',function(){
                                    $('#menu_overlay').show();
                                });
				$('#'+menuref).addClass('menuactive');			
				$('#p_main_wrapper').css('height',bheight+'px');
				$('body,html,#p_main_wrapper').css('overflow','hidden');                                
                                $('.menuexpand').removeClass('current_menu_item');
                                $(this).addClass('current_menu_item');
			}
			event.preventDefault();
		});
		
		/*$('#menu_overlay').click(function(){
			$('.menucollapse:visible').slideUp(200);
			$('#menu_overlay').fadeOut(150);
			$('body,html,#p_main_wrapper').css('overflow','auto');
		});*/
		$('#menu_overlay').click(function(){			
			$('#'+menuref).removeClass('menuactive');
			$('#'+menuref).transition({'top':'-500px'},700,'easeInOutQuart');
			$('#menu_overlay').delay(200).fadeOut(200);
			$('#p_main_wrapper').css('height','');
			$('body,html,#p_main_wrapper').css('overflow','auto');
                        $('.menuexpand').removeClass('current_menu_item');
		});
		
		
		$(window).resize(function(){
			bheight = $(window).height();
			if($('#menu_overlay').is(':visible')){
				$('#p_main_wrapper').css('height',bheight+'px');
			}else{
				$('#p_main_wrapper').css('height','');
			}
			if(bheight < 500 ){
				if($('#cartheader').length > 0){$('#cartheader').css('max-height','220px');}
				if($('#toggle-search').length > 0){$('#toggle-search').css('max-height','220px');}
				if($('.notification_scroll').length > 0){$('.notification_scroll').css('max-height','220px');}
				$('.cat_scroll').css('max-height','185px');
			}else{
                            $('.cat_scroll,.notification_scroll,#cartheader,#toggle-search').css('max-height','');                 
                        }
		});
                
    

});

function isIE () {
  var myNav = navigator.userAgent.toLowerCase();
  return (myNav.indexOf('msie') != -1) ? parseInt(myNav.split('msie')[1]) : false;
}

(function(document,navigator,standalone) {
// prevents links from apps from oppening in mobile safari
// this javascript must be the first script in your <head>
if ((standalone in navigator) && navigator[standalone]) {
    //alert('test');
    // Window scroll
    var scrolltimeHandle;
    $(window).scroll(function(){
        $('.standalone_backtop').fadeIn(300);
       var dtop = $(document).scrollTop();       
       if(dtop == 0){          // alert(dtop);
           $('.standalone_backtop').fadeOut(300);
        }else{
            window.clearTimeout(scrolltimeHandle);
           scrolltimeHandle = setTimeout(function(){$('.standalone_backtop').fadeOut(300);},3000);
       }
    });
var curnode, location=document.location, stop=/^(a|html)$/i;
document.addEventListener('click', function(e) {
curnode=e.target;
while (!(stop).test(curnode.nodeName)) {
curnode=curnode.parentNode;
}
// Condidions to do this only on links to your own app
// if you want all links, use if('href' in curnode) instead.
if('href' in curnode && ( curnode.href.indexOf('http') || ~curnode.href.indexOf(location.host) ) ) {
e.preventDefault();

location.href = curnode.href;
}
},false);
}
})(document,window.navigator,'standalone');
