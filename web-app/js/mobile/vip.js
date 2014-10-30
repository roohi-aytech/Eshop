function updateprice(price, action){
	var flag = false;
	var inventory_count = $('#inventory_count').val();
	var max_inventory_count = $('#max_inventory_count').val();
	//alert(inventory_count +'<='+ max_inventory_count);
	if(inventory_count > max_inventory_count){
		max_inventory_count = inventory_count;
	}
	//alert(max_inventory_count);
	if($("#config_qty").length == 0) {
		  //simple action
		flag = true;
	}else{
		//config action
		if(!$("#config_qty").hasClass("disabled")){
			flag = true;
		}else{
                        showdropcolor();
			//alert($('#attr_val').text());
			return false;
		}

	}
	if(!flag){
		alert($('#attr_val').text());
		return true;
	}
	var count = parseInt($('#qty').val());

	if(typeof(count)==='undefined' || isNaN(count) || count == 0) {
		alert($('#attr_val').text());
	}

	if(count > 0 ){
		if(action == 'up'){
			var qty         = parseInt(count + 1);
		}else if(action == 'down'){
			var qty         = parseInt(count - 1);
		}
		if(qty > 0 && count <= max_inventory_count){

			if(qty >= max_inventory_count){
				$('#qty').val(max_inventory_count);
				qty = max_inventory_count;
			}else{
				$('#qty').val(qty);
			}
			var priceVal    = jQuery("#updatedPrice").val();
			var updateprice = qty*priceVal;
			//document.getElementById("total-price").innerHTML = 'Total <font class="WebRupee">Rs. </font>'+addSeparatorsNF(Math.round(updateprice), '.', '.', ',')+'';
            $("#price-val").text(addSeparatorsNF(Math.round(updateprice), '.', '.', ','));

            if(updateprice >= 3000){
            	$('#emi_strip').show();
            	emi_option_display(updateprice);
            }else{
            	$('#emi_strip').hide();
            }
		}else{
				$('#qty').val(1);

		}

	}else{
		$('#qty').val(count);
	}

}

function addSeparatorsNF(nStr, inD, outD, sep)
{
	nStr += '';
	var dpos = nStr.indexOf(inD);
	var nStrEnd = '';
	if (dpos != -1) {
		nStrEnd = outD + nStr.substring(dpos + 1, nStr.length);
		nStr = nStr.substring(0, dpos);
	}
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(nStr)) {
		nStr = nStr.replace(rgx, '$1' + sep + '$2');
	}
	return nStr + nStrEnd;
}
// Add to cart function for wishlist
function addToCart(product_id,flag){
	var p_id = product_id;
	var qty  = $("#qty-"+flag).val();
	setCart(p_id , qty);
}
function setCart(product_id, qty, redirect_callback, configure, prod_crum,buy_now){
    	if(typeof(qty)==='undefined') {
			qty = 1;
		}else{
			//post data
		}
    	if(typeof(redirect_callback)==='undefined') {
    		redirect_callback = '';
		}
    	if(typeof(configure)==='undefined') {
    		configure = 0;
		}
		//alert(prod_crum);
		params = {};
		params['crumb']=prod_crum;

		//var ex = 'cp=ac';
                params['request']='mobile';
		if(typeof(buy_now)!='undefined' && buy_now==1) {
    		params['buy_now']=1;
    		ex = 'cp=bn';
		}
		//ac = add to cart
        //console.log(params);
		$.ajax({
			url:root_url+'/cart/add',
			type:'POST',
			data:{product_id:product_id,qty:qty,params:params},
                        beforeSend:function(){
                            $('#add_cart').addClass('active_loader_green');
                        },
			success: function (data){
                                $('#add_cart').removeClass('active_loader_green');
				if($.isNumeric(data))
				{
					if(data == '0')
					{
						alert('Out Of Stock');
					}
					else
					{
						alert('You can add max '+data+' quantity for this product');
					}
				}
				else
				{
					/*$('.transparent_bg').hide();
					$('.quick_look').html('');
					$('#cartheader').html(data);

					if(!redirect_callback){
						$("#item_info").addClass("selected");
						$('#cart_popup').show();
					}*/
					//$(window).scrollTop(0);
                                        $('body,html').animate({scrollTop:0}, 500);
					//$("#cartheader").show();
                                        $('#cart-div').html(data);
                                        $('#cart_msg').show().delay(10000).fadeOut();

                                    	var cart_count = $('#mshow_item_total').text();
                                    	if(parseInt(cart_count) > 0) {
                    						var footer = '<div class="acnt-btn"><h3>Your Cart('+cart_count+')</h3></div>';
                    						$('#a-footer-cart').html(footer);
                    						$('#a-footer-cart').removeClass('hide');
                    					} else {
                    						var footer = '';
                    						$('#a-footer-cart').html(footer);
                    						$('#a-footer-cart').addClass('hide');
                    					}

					 if(redirect_callback != ''){
						 window[redirect_callback]();
					 }
					 return false;
				}
			},
			error : function(){
				alert('Try later.');
			}
		});
}
var b_scr_amt;
//$("#add_cart").on('click',function(){
$(document).on('click','#add_cart',function(event){
	event.stopImmediatePropagation();
        //console.log($('#add_cart').hasClass('disabled'));
        if($('#add_cart').hasClass('disabled'))
        {
            $('#config_sel').addClass('select_error');
        }
        else
        {
            $('#config_sel').removeClass('select_error');
            var flag = false;
            if($("#config_qty").length == 0) {
                      //simple action
                    flag = true;
            }else{
                    //config action
                    if(!$("#add_cart").hasClass("disabled")){
                            flag = true;
                    }else{
                            showdropcolor();
                            //alert($('#attr_val').text());
                            return false;
                    }
            }
            if(!flag){
                    alert($('#attr_val').text());
                    return true;
            }

            if(flag){
                    var pid = parseInt($("#product_id").val());
                    //var qty = parseInt($("#qty").val());
                    var qty = 1;
                    var cat_crum = $("#cat_crum").val();
                    //alert(pid + ", " +qty);
                    if(typeof(pid)==='undefined' || isNaN(pid)) {
                            var pid = jQuery("#product_id_sel").val();
                    }
                    if(typeof(qty)==='undefined' || isNaN(qty) || qty == 0) {
                            alert($('#attr_val').text());
                    }
                    //alert(pid);
                    if(pid > 0 && qty > 0){
                            setCart(pid, qty,'','',cat_crum);
                    }
            }
        }
});

$(document).on("keypress" ,"#cod_pincode",function(e){
       if(e.which == 13){//Enter key pressed
           //$('#check_pin_submit').click();//Trigger search button click event
           //alert('fsd');
           checkpincode();
           e.stopPropogation();
       }
  });
 //pincode check
 //$('#check_pin_submit').click(function(e){
 $(document).on('click','#check_pin_submit',function(e){
         checkpincode();
         //e.stopPropogation();
 });

 /*Pincode validation*/
 $("#cod_pincode").keydown(function (e) {
    var pin = $('#cod_pincode').val();
    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 || (e.keyCode == 65 && e.ctrlKey === true) || (e.keyCode >= 35 && e.keyCode <= 39)) {
        return;
    }
    if ((e.keyCode < 48 || e.keyCode > 57) && (e.keyCode < 96 || e.keyCode > 105) || (pin.length > 5)) {
        e.preventDefault();
    }
});
function checkpincode()
{
        $('#cod_message').html('');
        //e.stopImmediatePropagation();
        $('#post_pincode_yes').html('');
        $('#pincode_yes').hide();
        $('#post_pincode_no').html('');
        $('#pincode_no').hide();
        $('#check_cod_option').show();
        $('#pin_check_result').hide();
        $('#cod_yes').hide();
        $('#cod_no').hide();
        $('#serv_msg').html('');
        //$('#cod_msg').html('');
        var pincode           = $('#cod_pincode').val();
        var prc_code          = $('#cod_prc_code').val();
        var sku               = $('#cod_sku').val();
        var supplier_id       = $('#cod_supplier_id').val();
        var cod_exist         = $('#cod_open').val();
        var int_ship          = $('#int_ship').val();
        var product_id        = $('#product_id').val();
        var cod_auction = 0,brand_id=0,assembly_check=0,brand_name=0;
        cod_auction = $('#cod_auction').val();

        if ($('#brand_id').length > 0){
            brand_id          = $('#brand_id').val();
            brand_name        = $('#brand_name').val();
            assembly_check    = $('#assembly_check').val();

        }
        if(pincode == ''){
            $('#cod_pincode').val('');
            $('#cod_pincode').addClass('inputerror').attr('placeholder','Invalid pincode');
                //$('#cod_message').html('<span class="red">Enter valid pincode (e.g. 400001)</span>');
                return false;
        }
        if(pincode.length < 6){
            $('#cod_pincode').val('');
            $('#cod_pincode').addClass('inputerror').attr('placeholder','Invalid pincode');
               // $('#cod_message').html('<span class="red">Enter valid pincode (e.g. 400001)</span>');
                return false;
        }
        if(pincode.length > 8){
            $('#cod_pincode').val('');
            $('#cod_pincode').addClass('inputerror').attr('placeholder','Invalid pincode');
                //$('#cod_message').html('<span class="red">Enter valid pincode (e.g. 400001)</span>');
                return false;
        }
        if(isNaN(pincode)){
            $('#cod_pincode').val('');
            $('#cod_pincode').addClass('inputerror').attr('placeholder','Invalid pincode');
                //$('#cod_message').html('<span class="red">Enter valid pincode (e.g. 400001)</span>');
                return false;
        }


        var ajaxLoading = false;

        if(!ajaxLoading){
                ajaxLoading = true;
                $.ajax({
                        url:'/pincode/is_product_serviceable',
                        data:'pincode='+pincode+'&prc_code='+prc_code+'&sku='+sku+'&supplier='+supplier_id+'&cod_exist='+cod_exist+'&int_ship='+int_ship+'&brand_id='+brand_id+'&assembly_check='+assembly_check+'&product_id='+product_id,
                        type:'post',
                        success:function(data){
                            ajaxLoading = false;
                            data = $.trim(data);
                                  try {
                                    data = $.parseJSON(data);
                                  } catch (e) {
                                      // not json
                                          if(data == 'pincode must be in digit'){
                                                  $('#cod_message').html('<span class="red">Enter valid pincode (e.g. 400001)</span>');
                                                  return false;
                                          }
                                  }
                            var nonserv_flag = 0;
                            var cod_str  = '';
                            var serv_str = '';
                            var date_str  = '';
                            var assembly = '';
                            $('#free_ship').hide();
                            $('#order_today_delivery_msg').hide();
                            $('#order_today_ship_msg').hide();
                            //$('#mode_transport').hide();
                            $('#assembly_msg').hide();
                            $('#cod_msg').hide();

                            if(data.serviceable){
                                    $('#pincode_div').hide();
                                    $('#pin_check_result').show();
                                    if(data.serviceable == 'not available'){

                                        serv_str = 'This item can NOT be Delivered to your location';
                                        $('#check_text').html('<span class="red">This item can\'t be Delivered </span><span id="msg_for_to" class="red">to: </span><a href="javascript:void(0);" style="text-decoration:none;" id="show_cod_box_yes"><span class="black" id="post_pincode_no"><u>'+pincode+'</u></span></a>');
                                        nonserv_flag = 1;
                                        $('.pin-terms').css('display','none');

                                    }else if(data.serviceable == 'available'){

                                        serv_str = 'This item can be Delivered to your location';
                                        $('#check_text').html('<span class="green">This item can be Delivered </span><span id="msg_for_to" class="green">to: </span><a href="javascript:void(0);" style="text-decoration:none;" id="show_cod_box_yes"><span class="black" id="post_pincode_no"><u>'+pincode+'</u></span></a>');
                                        nonserv_flag = 0;
                                        $('.pin-terms').css('display','block');

                                    }
                            }
                            if(data.cod && nonserv_flag != 1){
                                $('#check_cod_option').hide();
                                $('#pin_check_result').show();
                                if(cod_exist == 1){
                                    if(data.cod == 'not available'){

                                        cod_str = '<p>COD <span class="red">not available </span> for your location</p>';

                                    }else if(data.cod == 'available'){

                                        cod_str = '<p>COD <span class="green">available </span> for your location</p>';

                                    }
                                }else{
                                    $('#cod_msg').show();
                                }
                                //$('#cod_message').html('<span class="red">'+data.cod+'.</span>');
                            }

                            if(data.assembly && nonserv_flag != 1){
                                var assembly_not_provided_msg = '<a href="javascript://">Assembly required, to be arranged by yourself\n\
                                                                    <div id="no_assembly_tip">\n\
                                                                        <span class="international-price tooltip-inner lfbt">\n\
                                                                            We\'re unable to provide assembly services for this pincode. You\'ll need to make offline arrangements for this item.\n\
                                                                            <span class="tip"></span>\n\
                                                                        </span>\n\
                                                                    </div>\n\
                                                                </a>';
                                if(data.assembly === 'available_by_pepperfry' && (assembly_check === '2' || assembly_check === '1')) {
                                      assembly = '<p>Assembly: <span class=\"green\">Provided By Pepperfry</span></p>';
                                }else if(data.assembly === 'not available' && assembly_check === '1'){
                                      assembly = assembly_not_provided_msg;
                                }else if(data.assembly === 'available' && assembly_check === '1'){
                                      assembly = '<p>Assembly: <span class=\"green\">Provided By Pepperfry</span></p>';
                                }else if(data.assembly === 'not available' && assembly_check === '2'){
                                      assembly = assembly_not_provided_msg;
                                }else if(data.assembly === 'available' && assembly_check === '2'){
                                      assembly = '<p>Assembly: <span class=\"green\">Provided By "'+brand_name+'</span></p>';
                                }else if(assembly_check === '3'){
                                      assembly = '<p><span class=\"green\">Simple Assembly, Can be managed by Self</span></p>';
                                }else if(assembly_check === '4'){
                                      assembly = '<p><span class=\"green\">No Assembly Required</span></p>';
                                }else {
                                      assembly = '';
                                }
                            }
                            if(data.delivery_date && data.serviceable === 'available' && nonserv_flag != 1){
                                $('#order_today_delivery_msg span').html(data.delivery_date);
                                $('#order_today_ship_msg').hide();
                                $('#order_today_delivery_msg').show();
                                $('#mode_transport').show();
                            } else if (data.serviceable === 'not available') {
                                $('#order_today_delivery_msg,#order_today_ship_msg').hide();
                                //$('#order_today_no_delivery_msg').show();
                            } else {
                                $('#order_today_delivery_msg').hide();
                                $('#order_today_ship_msg').show();
                            }
                            if(nonserv_flag != 1){
                                $('#free_ship').show();
                            }else{
                                $('#mode_transport').hide();
                            }
                            if(cod_str){
                                $('#cod_msg').show();
                                $('#cod_msg').html(cod_str);
                            }
                            if(assembly){
                                $('#assembly_msg').show();
                                $('#assembly_msg').html(assembly);
                            }
                        },error:function(){
                                ajaxLoading = false;
                                $('#cod_message').html('<span class="red">please try later</span>');
                        }
                });
        }
        return false;
}
$(document).on('click', '#show_cod_box_yes',function(){
        $('#pincode_div').show();
        $('#pin_check_result').hide();
        $('.pin-terms').css('display','none');
});
$(document).on('click', '#show_cod_box_no',function(){
        $('#pincode_div').show();
        $('#pin_check_result').hide();
        $('.pin-terms').css('display','none');
});
$('#cod_pincode').focus(function(){
    if($(this).hasClass('inputerror')){
        $(this).val('');
        $(this).removeClass('inputerror');
        $(this).attr('placeholder',$(this).data('defplace'));
    }
});
function makeWish(product_id)
{
	var path = secure_url + "/customer_wishlist/add";
    var login = secure_url + "/customer/login";
    dType = 'https:' == location.protocol ? 'json' : 'jsonp';
    $.ajax({ url: path,
		data:{product_id : product_id},
		dataType:dType,
        type: "POST",
        success: function(data){
        	if(data == "true"){
        		$('#wish_heartimg').attr('src',root_url+'/img/m/heart_red.png');
                $('#wish_text').text('ADDED TO WISHLIST');
        	}
            else if(data == "3")
            {
            	$('#wish_heartimg').attr('src',root_url+'/img/m/heart_red.png');
                $('#wish_text').text('ADDED TO WISHLIST');
            }
            else {
            	window.location.href=root_url+"/customer/login";
            }
        },
        error: function(x,y,z){
        	alert('An error has occurred:\n'+x+'\n'+y+'\n'+z);
        }
    });
}
//mobile
$('#config_sel').change(function(){
    $val=$('#config_sel').val();
    console.log($val.length);
    if($val.length > 0)
    {
        $arr=$val.split(',');
        updateconfigprice($arr[0],$arr[1],"'"+$arr[2]+"'");
    }
    else
    {
            if(!$('#add_cart').hasClass('disabled')){
            $('#add_cart').addClass("disabled");
            }
        return false;
    }
});

if (isIE ()){
    bheight = $(window).height();
   // alert(bheight);
    $('.itemdetails').on('click', function(event){
        b_scr_amt = $(document).scrollTop();
        bheight = $(window).height();
        idnm=$(this).attr('id');
        //$('body,html').scrollTop(0);
        $('.'+idnm).css('display','block').animate({right:0},400);
        $('#p_main_wrapper').css({'height':bheight+'px'});
        event.preventDefault();
    });
}else{
$('.itemdetails').on('click', function(event){
    //$id=$(this).children().attr('id');

    idnm=$(this).attr('id');
         b_scr_amt = $(document).scrollTop();
         bheight = $(window).height();
        $('#p_main_wrapper').css({'height':bheight+'px','margin-top':'-'+b_scr_amt+'px'});
       // $('.'+idnm).show();
        $('.'+idnm).css('display','block').transition({right:0},400, 'linear');
    event.preventDefault();
});
}



$('.go-back').on('click', function(event){
    var cls = $(this).parents().eq(2).attr('class').split(' ')[0];
                if (isIE ()){
                    $('.'+cls).animate({right:'-100%'},400);
                } else{
                    $('.'+cls).transition({right:'-100%'},400, 'linear');
                }
		var t = setTimeout(function(){
			$('.'+cls).hide();
			clearTimeout(t);
		},400);
                $('#p_main_wrapper').css({'height':'','margin-top':0});
                $('body,html').scrollTop(b_scr_amt);
                event.preventDefault();
	});

$('#emi_option').on('click', function(event){
                bheight = $(window).height();
                b_scr_amt = $(document).scrollTop();
		//$('#emi_div').height($('body').outerHeight() + 30);
                $('#p_main_wrapper').css({'height':bheight+'px','margin-top':'-'+b_scr_amt+'px'});
		$('#emi_div').show();
                if (isIE ()){
                    $('#emi_div').animate({right:0},400);
                }else{
                    $('#emi_div').transition({right:0},400, 'linear');
                }
                event.preventDefault();
	});
/*$('#div-emi-back').on('click', function(event){
		$('#emi_div').transition({right:'-100%'},400, 'linear');
		var t = setTimeout(function(){
			$('#emi_div').hide();
			clearTimeout(t);
		},400);
                event.stopPropagation();
	});  */
// Script to assign width for Product image slider
var product_wrap_width = 0, popimg_url,current_el,prev_el,next_el, slide_prod_cnt = -1, bheight, imgclick_cnt = 0,current_el_id=1;
$(document).ready(function(){
    $('#product_slider .product_slides').each(function(){
        //slide_prod_cnt =slide_prod_cnt+1;
        slide_prod_cnt +=2
        product_wrap_width = product_wrap_width + parseInt($(this).width()) + 10;
});
$('#product_slider').width(product_wrap_width - 9);
$(".product_images").mouseenter(function(){
        $('.product_images').removeClass('swatchwhite');
});
$(".product_images").mouseleave(function(){
        $('.product_images').addClass('swatchwhite');
});
//script for gallery popup
		$('a[rel="popup"]').click(function(event){
			bheight = $(window).height();
			$('#image_popup').css('line-height',bheight+'px');
			$('#p_main_wrapper').css('height',bheight+'px');
			current_el_id = $(this).data('relid');
			$('a[rel="popup"]').removeClass('active');
			$('a[data-relid="'+current_el_id+'"]').addClass('active');
			popimg_url = $('a[data-relid="'+current_el_id+'"]').attr('href');
			$('#image_popup img').attr('src',popimg_url);
			//var refelement = $(this).attr('href');
			$('#image_popup').fadeIn(200);
			$('body,html,#p_main_wrapper').css('overflow','hidden');
                        if($(this).parents('.product_slides').attr('id') == 'product_slide1'){
                            $('#prev_prod').hide();
                        }else{$('#prev_prod').show();}
                        //else if($(this).parents('.product_slides'))
                        console.log($(this).index());
                        console.log($('.product_slides').length-1);
                        console.log($(this).parents('.product_slides').index());
                        if($(this).index() == 1 && (($('.product_slides').length-1) == $(this).parents('.product_slides').index())){
                            $('#next_prod').hide();
                        }
                       console.log(current_el_id);
             if(current_el_id == $('a[rel="popup"]').length-1){$('#next_prod').hide();  console.log('test');}else{$('#next_prod').show();}
			event.preventDefault();
		});

		$(window).resize(function(){
			bheight = $(window).height();
			$('#image_popup').css('line-height',bheight+'px');
			if($('#image_popup').is(':visible')){
				$('#p_main_wrapper').css('height',bheight+'px');
			}
		});

		$('#image_popup img').click(function(){
			if(imgclick_cnt == 0){
				$(this).removeClass('max_img');
				imgclick_cnt = 1;
                                $('.img_tap_msg').fadeOut(200);
			}else{
				$(this).addClass('max_img');
				imgclick_cnt = 0;
                                $('.img_tap_msg').fadeIn(200);
			}

		});


		$('.close_overlay').click(function(){
			$('#image_popup').fadeOut(200,function(){
				$('#image_popup').removeClass('current');
			});
			$('body,html,#p_main_wrapper').css('overflow','auto');
			$('#p_main_wrapper').css('height','');
			$('#image_popup img').addClass('max_img');
		});

		$('#prev_prod').click(function(event){
			prev_el = current_el_id - 1;
                        $('#loadimage').css('display','block');
			if($('a[data-relid="'+prev_el+'"]').length > 0){
				current_el_id = prev_el;
				$('a[rel="popup"]').removeClass('active');
				$('a[data-relid="'+current_el_id+'"]').addClass('active');
				popimg_url = $('a[data-relid="'+current_el_id+'"]').attr('href');
				$('#image_popup img').attr('src',popimg_url);
                                $('#loadimage').fadeOut(100);
				//console.log(popimg_url);
				if($('#next_prod').is(':hidden')){$('#next_prod').fadeIn();}
				if(prev_el == 0){$('#prev_prod').fadeOut(100);}
			}
			event.preventDefault();
		});
		$('#next_prod').click(function(event){
                    //console.log("Product Count : "+slide_prod_cnt + " Current "+current_el_id);
			next_el = current_el_id + 1;
			console.log(next_el);
                        $('#loadimage').css('display','block');
			//console.log(slide_prod_cnt + ' ' + next_el);
			if($('a[data-relid="'+next_el+'"]').length > 0){
				current_el_id = next_el;
				$('a[rel="popup"]').removeClass('active');
				$('a[data-relid="'+current_el_id+'"]').addClass('active');
				popimg_url = $('a[data-relid="'+current_el_id+'"]').attr('href');
				$('#image_popup img').attr('src',popimg_url);
                                $('#loadimage').fadeOut(100);
				//console.log("Next :: "+next_el);
				if($('#prev_prod').is(':hidden')){$('#prev_prod').fadeIn();}
				if(next_el == slide_prod_cnt - 1){$('#next_prod').fadeOut(100);}
			}
			if($('a[data-relid="'+current_el_id+'"]').attr('id') == 'lastslide_img'){$('#next_prod').fadeOut();}

			event.preventDefault();
		});

lazyLoad("img.lazy");

$(".btnminus").click(function(){
            $id=$(this).attr('id');
            $qty = $(this).siblings("input.value");
            if($qty.val() > 1){
                    $qty.val(parseInt($qty.val() - 1));
            }
            $id_arr=$id.split('-');
            var quantity=$('#qty-'+$id_arr[1]).val();
            var price=quantity * $('#originalprice-'+$id_arr[1]).html();
            if(price > 0)
            {
                $('#totalprice-'+$id_arr[1]).text(price);
            }
    });

    $(".btnplus").click(function(){
            $id=$(this).attr('id');
            $qty = $(this).siblings("input.value");
            $new_val = parseInt($qty.val()) + 1;
            $qty.val($new_val);
            $id_arr=$id.split('-');
            var quantity=$('#qty-'+$id_arr[1]).val();
            var price=quantity * $('#originalprice-'+$id_arr[1]).html();
            if(price > 0)
            {
                $('#totalprice-'+$id_arr[1]).text(price);
            }
        });

     //add items in cart
     $('.allpids').click(function(){
         $ids=$('#cart_pids').val();
         var url= root_url+"/customer_account/addItemsincart/"+$ids;
         window.location.href=url;
     });

      var hashcnt = 0;
        // Back button prevent state
        $(document).on('click','.bbq', function(event){
		var state = {},
		id = $(this).prop( 'id' );
		state[ 'url' ] = $(this).data( 'q' );
		$.bbq.pushState( state );
		//clcnt = 1;
		event.stopPropagation();
	});
	var baseurl = window.location.href;
	$(window).bind( 'hashchange', function(event) {
		var url = event.getState("url");
		if(url === 'filters-back'){
                    $('.close_overlay').trigger('click');
                    $('#p_main_wrapper').css({'height':'','margin-top':0});
                    $('body,html').scrollTop(b_scr_amt);
                    $('.right_slides').transition({right:'-100%'},400, 'linear');
		}
	});

	var st = {};
	st[ 'url' ] = 'filters-back';
	$.bbq.pushState( st );

});


//end
// ajax function to deletewishlist used in wishlist.phtml
function deleteWishlist(wishlist_item_id)
{
    //var responce = confirm('Do you want to remove this item from wishlist?');
    var responce=true;
    if(responce == false)
    {
            return false;
    }else
    {
        var path = ('https:' == document.location.protocol ? 'https://' : 'http://')+server_name+"/customer_wishlist/deleteWishlistItem/";
        $.ajax({
            url: path,
            data:{itemToDelete : wishlist_item_id},
            type: "POST",
            success:function(data){
                    if(data == 1)
                    {
                            //window.location.reload();
                            $('#li-'+wishlist_item_id).remove();
                            $('#wishlist_item_cnt').text($('#wishlist_item_cnt').text()-1);
                    }
            },
            error: function(x,y,z){
                    alert('An error has occurred:\n'+x+'\n'+y+'\n'+z);
            }
        });
    }
}
function updateconfigprice(pid, price, attr_value){
    var pid      = pid;
	//if( price <= 0){
	var priceVal    = $("#initialPrice").val();
	var updateprice = (1*priceVal)+parseInt(price);
	var child_discount=$('#child_discount').val();
        $('#product_id').val(pid);
	var child_discount_values=$.parseJSON(child_discount);

	if(child_discount_values.hasOwnProperty(pid))
	{
		if(child_discount_values[pid].you_pay > 0)
		{
			updateprice=child_discount_values[pid].you_pay;
		}
	}
	$("#updatedPrice").val(updateprice);
	$("#price-val").text(addSeparatorsNF(Math.round(updateprice), '.', '.', ','));
    if(updateprice >= 3000){
    	$('#emi_option').show();
    	emi_option_display(updateprice);
    }else{
    	$('#emi_option').hide();
    }

	if(pid > 0){
		$.ajax({
			url:root_url+'/site_product/configure_product_qty/'+pid,
			type:'GET',
			success:function(data){
				var data = $.trim(data);
				if(data == 1){
                                        /*if green class is remvoed in OOS case then add and if oos class is set then remove */
                                        if(!$('#vip-cart-div').hasClass('light-grn-btn'))
                                        {
                                            $('#vip-cart-div').addClass('light-grn-btn');
                                        }
                                        if($('#vip-cart-div').hasClass('acnt-btn vip_oos'))
                                        {
                                            $('#vip-cart-div').removeClass('acnt-btn vip_oos');
                                        }
					$('.count').html('<input type="text" name="count" id="qty" value="1" disabled="disabled" class="qty_inpt"/>');
					$('.qty').show();
					//$('#in-stock').html('This item is <span class="green">Available</span>');
					$('#config_qty').removeClass('disabled');
					$('#add_cart').removeClass('disabled');
					//$('#buy_imm').removeClass('disabled');
					//$('#buy_imm').addClass('pulse');
					if($('#drop_conf').length > 0){
						$('#drop_conf').removeClass('disabled_color');
					}
				}else{
					/*for out of stock*/
					$('#vip-cart-div').empty();
                                        $('#vip-cart-div').removeClass('light-grn-btn');
                                        $('#vip-cart-div').addClass('acnt-btn vip_oos');
                                        $('#vip-cart-div').html('<img src="'+root_url+'/img/m/item_oos_icon.png" align="absmiddle"> This item is currently Out Of Stock');
					//$('#in-stock').html('This item is <span class="red">Out of Stock</span>');
				}

			}
		});
	}
}



function chkpincode(){
	$('#cod-red').hide();
	$('#cod-green').hide();
	var cpincode = $('#cpincode').val();
	if(cpincode == ''){
		$('#cod-red').show();
	}else{
		$.ajax({
			url:root_url+'/site_product/pincode_available/'+cpincode,
			success: function(data){

				if(data == 1){
					$('#pin-not-possible').show();
					$('#cod-green').show();
                                        $('#cod-red').hide();
				}else{
					$('#pin-not-possible').show();
                                        $('#cod-green').hide();
					$('#cod-red').show();
				}
			}
		});
	}
	return false;
}

function emi_option_display(price){
	if($('#emi_breakup').length > 0) {
		var emi_data     = $('#emi_breakup').val();
		var emi_breakup  = $.parseJSON(emi_data);
		var lowest_price = price;
		$('#emi_price_for').html(addSeparatorsNF(Math.ceil(price), '.', '.', ','));
			for(var key in emi_breakup){
				var payment=PMT(emi_breakup[key].rate/1200,emi_breakup[key].bu,- price).toFixed(2);
				//console.log('key => '+key+', pay => '+payment);
				$('#price_'+key).html('Rs.'+addSeparatorsNF(Math.ceil(payment), '.', '.', ','));
				if(payment <= lowest_price){
					lowest_price = Math.ceil(payment);
				}
			}
			$('#strip_emi_breakup').html(addSeparatorsNF(Math.ceil(lowest_price), '.', '.', ','));
			$('#emi_breakup').html(addSeparatorsNF(Math.ceil(price), '.', '.', ','));
	}
}

function PMT(i, n, p)
{
	return i * p * Math.pow((1 + i), n) / (1 - Math.pow((1 + i), n));
}
function attachEvents() {

}
$('.close_item').click(function(){
        $(this).parents('li').find('.undo').transition({right:0},200, 'linear');
        $(this).parents('li').addClass('undoactive');
        showrestore();
});

$('.undo').click(function(){
        $(this).parents('li').find('.undo').transition({right:'-100%'},200, 'linear');
        $(this).parents('li').removeClass('undoactive');
        cart_btnstoggling();
}).children('#close').click(function(e) {
        return false;
});
function showrestore()
{
        if($('.restore_btns_box').is(':hidden')){
                $('.restore_btns_box').fadeIn(300);
                $('.proceed_btn_box').fadeOut(300);
        }
}
function isIE () {
  var myNav = navigator.userAgent.toLowerCase();
  return (myNav.indexOf('msie') != -1) ? parseInt(myNav.split('msie')[1]) : false;
}
