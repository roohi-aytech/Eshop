jQuery(document).ready(function($){
	/*$("#order-summ div.close").click(function(){
		$parent = $(this).parent();
		$backup = $parent.html();
		console.log($backup);
		$ele = $parent.find("h4");
		$title = $ele.html();
		$parent.css('backgroundColor','#fffff2');
		$parent.html("<span class='undo'><a href='#' onclick='restore("+$backup+");'>Undo delete</a> ( "+$title+" )</span>");
		return false;
	});*/
	
	if($('.gt_confirmation_mobile').length > 0){
		eraseCookie('mdonate');
	}
	
	$('#growtree').prop('checked', function() {
		var growtreeChecked = $('#growtree').is(':checked');
		
		if(growtreeChecked)
		{
			growTree();
		}
	})
	
	$('a.grn-btn').on('click',function(){
		$(this).addClass('active_loader_green');
	});

	$("div#coupon button.coupon_action").on("click",function(e){
			$('.coupon_error').html('');
			var name=$(this).attr('name');
			$('#coupon_blank').html('').hide();
			$('div#coupon input.ib').css('border','');

			if($("div#coupon input.ib").val() == "" && name=='apply')
			{
				$('div#coupon input.ib').css('border','solid 1px #ec1e20');
				$('#coupon_blank').html('Please enter valid coupon code').show();
				e.preventDefault();
				return false;
			}
			else
			{
				var form_data = $('#cart-form').serialize();
				form_data += "&"+name+"=1";
				
				try
				{
					$.ajax({
						url:root_url+'/checkout/validate_coupon',
						type:'POST',
						async:false,
						data:form_data,
						beforeSend : function(x){
							$('#cart_loader').show();
						},
						success: function (resultHtml){			
							$('#cart_loader').hide();
							$('#mcart').replaceWith(resultHtml);
							e.preventDefault();
							return false;
						},
						error : function(r){
							$('#cart_loader').hide();
							console.log(r);
							return false;
						}
					});	
				}
				catch (e)
				{
					console.log(e);
				}
				return false;
				e.preventDefault();
			}
	});
	
	$("div#coupon button.cancel").click(function(){
		if(confirm("Remove Coupon Code?"))
		{
			if($("div#coupon input.ib").val() != "")
			{
				$("div#coupon input.ib").val("");
			}
		}
	});
		
	$("#order-summ li div.total span.quan span.dec").click(function(){
		$qty = $(this).siblings("input.value");
		var avl_qty = $(this).siblings("input.value").data('stock');
		// console.log($qty);
		// console.log($qty.val());

		if($qty.val() > 1){
			var new_val=parseInt($qty.val() - 1);
			$qty.val(parseInt($qty.val() - 1));
			$(this).removeClass('inactive').addClass('active');
			if(new_val == 1)
			{
				$(this).removeClass('active').addClass('inactive');
			}
			var price = $(this).siblings("input.value").data('price');
			var total = price * new_val;
			$(this).parent().siblings("h3.net").find('.netTotal').text(total);
		}else{
			$(this).addClass('inactive');
		}
		$(this).siblings("span.inc").addClass('active').removeClass('inactive');

		
	});

	$("#order-summ li div.total span.quan span.inc").click(function(){
		$qty = $(this).siblings("input.value");
		var new_val = parseInt($qty.val()) + 1;
		
		var avl_qty = $(this).siblings("input.value").data('stock');
		if($qty.val() < avl_qty){
			$qty.val(new_val);
			if(new_val == avl_qty){
				$(this).addClass('inactive').removeClass('active');
			}

			var price = $(this).siblings("input.value").data('price');
			var total = price * new_val;
			$(this).parent().siblings("h3.net").find('.netTotal').text(total);
		}
		
		if(new_val > 1)
		{
			$(this).siblings("span.dec").addClass('active').removeClass('inactive');
		}

		
	});
	/*$('.update_cart').click(function(){
		/*$('#order-summ ul li .cart_details').each(function(){
			var in_stock = $('.dec').siblings("input.value").data('stock');
			alert(in_stock);
			
		});
		$('#order-summ ul li .cart_details .total .quan').each(function(){
		 	var entered = $(this).find('.dec').siblings("input.value").val();
			var in_stock = $(this).find('.dec').siblings("input.value").data('stock');
			
			if(entered > in_stock)
			{
				$('.mstock').html('You can add max '+ in_stock +' quantity for this product');
			}
		});
    });*/

	$('.close_item').click(function(){
		$(this).parents('li').find('.undo').transition({right:0},200);
		$(this).parents('li').addClass('undoactive');
		showrestore();
	});

	$('.undo').click(function(){
		$(this).parents('li').find('.undo').transition({right:'-100%'},200);
		$(this).parents('li').removeClass('undoactive');
		cart_btnstoggling();
	}).children('.close').click(function(e) {
		return false;
	});

	$('.undo .close').click(function(){
		var current_li = $(this).parents('li');
		$(this).parents('li').transition({height:0,width:0,border:0,padding:0,margin:0,opacity:0},200,function(){
			//current_li.remove();
			current_li.css('display','none');			
		});
		showrestore();		
	});

	$('.update_cart_ctas .decline').click(function(event){
		$('#order-summ ul li.undoactive .undo').transition({right:'-100%'},200);
		//$('#order-summ ul li.undoactive .undo').css('right','-100%');
		//$('#order-summ ul li:hidden').css('display','block').transition({height:'100%',width:'100%',border:'1px solid #e8e8e8',padding:10,marginBottom:11,opacity:1},200);
		$('#order-summ ul li.undoactive').each(function(){
			if($(this).is(':hidden')){
				$(this).css('display','block').transition({height:'100%',width:'100%',border:'1px solid #e8e8e8',padding:10,marginBottom:11,opacity:1},200);
			}
		});
		$('#order-summ ul li .quan input[type="text"]').each(function(){
			$(this).val($(this).data('orgval'));

			var price = $(this).data('price');
			var new_val = $(this).data('orgval');
			var total = price * new_val;
			$(this).parent().siblings("h3.net").find('.netTotal').text(total);
		});
		showproceed();
		$('#order-summ ul li').removeClass('undoactive');
		event.preventDefault();
	});

	$('#order-summ ul li .quan input[type="text"]').bind('input', function(){
		cart_btnstoggling();
	});

	$('#order-summ ul li .dec,#order-summ ul li .inc').click(function(){
		cart_btnstoggling();
	});

	// Script for Apply Coupon
	$('#applycoupon').click(function(){
		if($(this).hasClass('clearcoupon')){
			$(this).attr('value','Apply').removeClass('clearcoupon');
			$('#coupontext').val('');
			$('.ib').prop('disabled', false);
		}else{			
			$(this).attr('value','Clear').addClass('clearcoupon');
			$('.ib').prop('disabled', true);
		}		
	});
	
	// Script for Address selection
	$('.addressgroup').change(function(){
		var c_el = $(this);
		$('.add_meta_wrapper').slideUp(200);
		c_el.siblings('.add_meta_wrapper').slideDown(200);	
	});
	
	$('.update_cart').on('click',function(e){
		e.preventDefault();
		var xtraquantity_flag = 0;
		$('.update_cart').addClass('active_loader_orange');
		$('#order-summ li.undoactive').remove();

		var form_data = $('#cart-form').serialize();
		form_data += "&cart_update=1";
		
		var mini_cart_flag=$('#mini_cart').val();


		$('#order-summ ul li .cart_details .total .quan').each(function(){
		 	var entered = $(this).find('.dec').siblings("input.value").val();
			var in_stock = $(this).find('.dec').siblings("input.value").data('stock');
			
			if(entered > in_stock)
			{	
				xtraquantity_flag = 1;
				$(this).parent().parent().find('.mstock').text('You can add max '+ in_stock +' quantity for this product');
				//alert('You can add max '+ in_stock +' quantity for this product');
				$('#cart_loader').hide();
				$('.update_cart').removeClass('active_loader_orange');
				
			}
	    });
		
		
		
		try
		{
		if(xtraquantity_flag == 0){
		$.ajax({
            url:root_url+'/checkout/validate_coupon',
            type:'POST',
			async:true,
            data:form_data,
			beforeSend : function(x){
				$('#cart_loader').show();				
			},
			success: function (resultHtml){
				$('#cart_loader').hide();
				$('.update_cart').removeClass('active_loader_orange');
				$('#mcart').replaceWith(resultHtml);
				var count=$('#total_items').val();
				
				if(count >=0)
				{	
					$('#mshow_item_total').text(count);
					if(count > 0) {
						if(mini_cart_flag!=1)
						{
							$('#footer_div').hide();
						}
						var footer = '<div class="acnt-btn"><h3>Your Cart('+count+')</h3></div>';
						$('#a-footer-cart').html(footer);
						$('#a-footer-cart').removeClass('hide');
						
					} else {
						if(mini_cart_flag!=1)
						{
							$('#footer_div').show();
						}
						
						var footer = '';
						$('#a-footer-cart').html(footer);
						$('#a-footer-cart').addClass('hide');	
					}
				}

				return false;

            },
            error : function(r){
				$('#cart_loader').hide();
				$('.update_cart').removeClass('active_loader_orange');
				//console.log(r);
				//alert('Try later.');
				return false;
            }
         });
		}
		}
		catch (e)
		{
			//console.log(e);
		}

         return false;
		 e.preventDefault();
		
	});

	//suhel script start
	/*$(".pay_option").on("click", function(event){
		var rel=$(this).attr('rel');
		if(typeof(rel)!=='undefined') {
			$('#pay-methods').hide();
			$('#'+rel).show();
			$('#address_data').hide();
			$('#final').show();
			$("#payment_method").val(rel);

			$("#checkout .method_option :radio").attr('checked',false);
			$('#checkout .method_option select option').attr('selected',false);
			//$('#checkout .method_option select option').attr('selected',false);

			$('#MAESTRO').hide();
			$('#VISA').hide();
			$('#MASTER').hide();
		}
		
		$('#checkout_error').html('');
		changeShippingValue();
	});

	$('.back_option').click(function(){
		$('.method_option').hide();
		$('#pay-methods').show();
		$('#address_data').show();
		$('#final').hide();

		$("#checkout .method_option :radio").attr('checked',false);
		$('#checkout .method_option select option').attr('selected',false);
	});*/
	
	
	var b_scr_amt,bheight;
	$('.pay_option').click(function(e){
		e.preventDefault();
		$('#final').show();
		var slideref = $(this).attr('rel');
	    b_scr_amt = $(document).scrollTop();
	    bheight = $(window).height();
	    $('.method_option').hide();
	    $('#'+slideref).show();
		if(isIE ()){
			b_scr_amt = $(document).scrollTop();
			bheight = $(window).height();
			var bheight1 = bheight + 100;
			$('#p_main_wrapper').css({'height':bheight+'px','margin-top':'-'+b_scr_amt+'px'});
			$('#final').css('padding-bottom','150px');
			$('#PAY_PANELS').css({'display':'block','padding-bottom':'150px'}).animate({'right':0},250);
		}else{
			b_scr_amt = $(document).scrollTop();
			bheight = $(window).height();
			$('#p_main_wrapper').css({'height':bheight+'px','margin-top':'-'+b_scr_amt+'px'});
			$('#PAY_PANELS').css('display','block').transition({'right':0},500);
		}
	    $('#p_main_wrapper').css({'height':bheight+'px','margin-top':'-'+b_scr_amt+'px'});
	    $("#payment_method").val(slideref);
	    $("#checkout .method_option :radio").prop('checked',false);
		$('#checkout .method_option select option').prop('selected',false);
	    $('#checkout_error').html('');
		$('.payment_error_msg').hide();
		changeShippingValue();
	});
	 
	$('.method_option .go-back').click(function(){
		$(this).parents('#PAY_PANELS').transition({right:'-100%'},400,function(){
			$('.method_option').css('display','none');
			$("#checkout .method_option :radio").prop('checked',false);
			$('#checkout .method_option select option').prop('selected',false);
	    });
		$('#final').hide();
		$('#errror_msg').addClass("hide");
	    $('#p_main_wrapper').css({'height':'','margin-top':0});
	    $('body,html').scrollTop(b_scr_amt);
            $('.emi').css('display','none');
	});

	$('#netBankingList').change(function(){
		//console.log('here');
		$("#NET_BANKING :radio").attr('checked',false);
	});

	$('#NET_BANKING :radio').click(function(){
		$('#NET_BANKING select option').attr('selected',false);
	});

	$('#codRadio').click(function() {
		changeShippingValue();
	});
	//suhel script end
	
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
            $('#p_main_wrapper').css({'height':'','margin-top':0});
            $('body,html').scrollTop(b_scr_amt);
            $('#PAY_PANELS').transition({right:'-100%'},400, 'linear');
            
	}
    });

    var st = {};
    st[ 'url' ] = 'filters-back';
    $.bbq.pushState( st );

	
	

}); //ready

	function restore($html)
	{
		console.log($html);
	}

	function cart_btnstoggling(){
		var changecnt = 0;
		$('#order-summ ul li .quan input[type="text"]').each(function(){
			if($(this).val() != $(this).data('orgval')){			
				changecnt++;
				if($('.restore_btns_box').is(':hidden')){
					$('.restore_btns_box').fadeIn(300);
					$('.proceed_btn_box').fadeOut(300);
				}
				return false;
			}
		});
		/*$('#order-summ ul li.undoactive').each(function(){
			//if ($(this).find('.undo').css('right') === '-100%'){
				changecnt++;
				if($('.restore_btns_box').is(':hidden')){
					$('.restore_btns_box').fadeIn(300);
					$('.proceed_btn_box').fadeOut(300);
				}
				return false;
			//}
		});*/

		if($('#order-summ ul li.undoactive').length > 0){
			changecnt++;
			if($('.restore_btns_box').is(':hidden')){
				$('.restore_btns_box').fadeIn(300);
				$('.proceed_btn_box').fadeOut(300);
			}
			return false;
		}
		
		if(changecnt == 0){
			$('.restore_btns_box').fadeOut(300);
			$('.proceed_btn_box').fadeIn(300);
		}
	}

	function showproceed(){
		if($('.proceed_btn_box').is(':hidden')){
			$('.proceed_btn_box').fadeIn(300);
			$('.restore_btns_box').fadeOut(300);
		}
	}

	function showrestore()
	{
		if($('.restore_btns_box').is(':hidden')){
			$('.restore_btns_box').fadeIn(300);
			$('.proceed_btn_box').fadeOut(300);
		}
	}

	//suhel functions start
	function setdebitCard()
	{
		$('#radio-MAESTRO').prop('checked', false);
        $('#MAESTRO').hide();

        $('#radio-VISA').prop('checked', false);
        $('#VISA').hide();

        $('#radio-MASTER').prop('checked', false);
        $('#MASTER').hide();
	}

	function setcreditCard()
	{
		$('#checkout #CREDIT_CARD select option').attr('selected',false);
		$('#americanExpress-radio').attr('checked', false);
		$('#credit-card-emi-billdesk').prop('checked', false);
		$('#credit-card-emi').hide();
		$('#american-card-type').hide();
		$('#EMI-MSG').hide();
		$('#credit-card-emi').val(0).trigger("change");
	}

	
	function showAmericanCardType()
	{
		//$("input:radio[name=payment_id]").attr('checked',false);
		$("#checkout .method_option :radio").attr('checked',false);
		$('#checkout .method_option select option').attr('selected',false);
		$('#americanExpress-radio').prop('checked', true);
		$('#american-card-type').show();
	}


	function showBanksList(cardType)
	{
		//console.log('here');
		$("#checkout .method_option :radio").attr('checked',false);
		$('#checkout .method_option select option').attr('selected',false);
		
		$('#radio-'+cardType).prop('checked', true);
		var checkedValue = document.getElementById("radio-"+cardType).checked;

		$('#paymentdebitcard-VISA').val(0).trigger("change");
		$('#paymentdebitcard-MASTER').val(0).trigger("change");
		$('#paymentdebitcard-MAESTRO').val(0).trigger("change");
				
		$('#radio-'+cardType).attr('checked', true); 
		
		if (cardType == 'VISA') 
		{
			$('#VISA').show();
			$('#MASTER').hide();
			$('#MAESTRO').hide();
		}
		else if (cardType == 'MASTER') 
		{
			$('#VISA').hide();
			$('#MAESTRO').hide();
			$('#MASTER').show();
		}
		else if (cardType == 'MAESTRO') 
		{
			$('#VISA').hide();
			$('#MASTER').hide();
			$('#MAESTRO').show();
		}
	}

	function growTree()
	{
		var total_pay=parseInt($('#gt').text());
		var donationChecked = $('#growtree').is(':checked');

		if(donationChecked)
		{
			var total_pay=total_pay + 30;
			$('#mgtree').show();
			
			var date = new Date();
			date.setTime(date.getTime() + (10 * 60 * 1000));
			createCookie('mdonate','1',{ expires: date });
		}
		else
		{
			var total_pay=total_pay - 30;
			$('#mgtree').hide();
			eraseCookie('mdonate');
		}

		$('#gt').text(total_pay);
	}
	function setDonation()
	{
		var total_pay=parseInt($('#final_pay').text());
		
		var donationChecked = $('#mydonation').is(':checked');

		if(donationChecked)
		{
			var total_pay=total_pay + 30;
			var date = new Date();
			date.setTime(date.getTime() + (10 * 60 * 1000));
			createCookie('mdonate','1',{ expires: date });
		}
		else
		{
			var total_pay=total_pay - 30;
			eraseCookie('mdonate');
		}

		$('#final_pay').text(total_pay);
		//$('#cartAmt').val(total_pay);
		
	}

	function showEMIValues(id,div)
	{
		var totalAMt = $('#totalPay').val();
		var emi_breakup_values=$('#emi_bu').val();
		var emi_breakup=$.parseJSON(emi_breakup_values);

		$('#'+div+'_calc').hide();
		
		$('#emi_note').hide();

		$('.emi-info').hide();
		$('#tax_note').hide();

		if(emi_breakup.hasOwnProperty(id))
		{
			var rate=emi_breakup[id].rate;
			var bu=emi_breakup[id].bu;

			if(totalAMt > 0 && rate > 0 && bu > 0)
			{
				var payment=PMT(rate/1200,bu,- totalAMt).toFixed(2);
				if(payment > 0)
				{
					var TOTAL=(payment * bu).toFixed(2);
					var INTREST=(TOTAL - totalAMt).toFixed(2);


					$('#charge').text(rate);
					$('#tenure').text(bu);
					$('#emi_note').show();
					$('#non_emi_note').hide();
					$('#'+div  +' .tenure_amount').text(bu + ' Months');
					$('#'+div +' .transaction_amount').text(addSeparatorsNF(Math.ceil(totalAMt),'.','.',','));
					$('#'+div +' .emi_charge').text(rate + '%');
					$('#'+div +' .emi_month').text(addSeparatorsNF(Math.ceil(payment),'.','.',','));
					$('#'+div +' .interest_amount').text(addSeparatorsNF(Math.ceil(INTREST),'.','.',','));
					$('#'+div +' .total_amount').text(addSeparatorsNF(Math.ceil(TOTAL),'.','.',','));

					$('#'+div+'_calc').show();

					if(id == 135 || id== 151 || id==156 || id==157)
					{
						$('#tax_note').show();
					}

				}
			}
		}
	}
	function PMT(i, n, p) 
	{
		return i * p * Math.pow((1 + i), n) / (1 - Math.pow((1 + i), n));
	}

	function showOption(option_name)
	{
		$('.emi').hide();
		$('#EMI select option').attr('selected',false);
		$('.EMI-MSG').hide();
		$('#emi_note').hide();
		$('#tax_note').hide();
		//$('#'+option_name).show();

		var totalAMt = $('#totalPay').val();
		//console.log(totalAMt);
		//var totalAMt =1000;
		if(totalAMt < 3000)
		{
			$('#'+option_name +' .EMI-MSG').show();
		}
		else
		{
			$('#'+option_name+'_box').show();
		}
	}

	function savemobileOrder() 
	{
		$('button.grn-btn').addClass('active_loader_green');
		var payment_method=$("#payment_method").val();
		var payment_id_radio = $('#'+payment_method + ' input:radio[class="payment-'+payment_method+'"]:checked').val();
		payment_id_radio = parseInt(payment_id_radio);

		var payment_id_select = 0;
		
		$('#'+payment_method + ' select.payment-'+payment_method).each(function(ele){
			if($(this).is(":visible")) {
				payment_id_select = parseInt($("#" + this.id).val());
			}
		});

		var payment_id;
		
		if (typeof(payment_id_radio) != 'undefined' && payment_id_radio > 0)
		{
			payment_id=payment_id_radio;
		}
		else if(typeof(payment_id_select) != 'undefined' && payment_id_select > 0)
		{
			payment_id=payment_id_select;
		}
		else
		{
			payment_id =0;
		}

		//console.log(' Payment id : '+payment_id); return false;
		if(payment_id == 0)
		{
			$('button.grn-btn').removeClass('active_loader_green');
			var error_msg='Please Select Proper Payment Option From ' + payment_method;
			//alert(payment_method);
			if(payment_method=='DEBIT_CARD')
			{
				error_msg='Please choose a Debit Card first';

				var maestroChecked = $('#radio-MAESTRO').is(':checked');
				if(maestroChecked)
				{
					var maestroOption=$('#paymentdebitcard-MAESTRO').val();
					if(maestroOption==0)
					{
						error_msg='Please select the issuing bank from the drop-down';
					}
				}
			}
			else if(payment_method=='CREDIT_CARD')
			{
				error_msg='Please choose a Credit Card first';
				var emiChecked = $('#credit-card-emi-billdesk').is(':checked');
				if(emiChecked)
				{
					var emiMsg= $("#EMI-MSG").is(':visible');
					if(!emiMsg)
					{
						var emiOption=$('#credit-card-emi').val();
						if(emiOption==0)
						{
							error_msg='Please select an EMI option from the drop-down';
						}
					}
					else
					{
						error_msg='EMI is only available on order value of Rs 3000 and above';
					}
				}

				var aexChecked = $('#americanExpress-radio').is(':checked');
				if(aexChecked)
				{
					var aexOption=$('#american-card-type').val();
					if(aexOption==0)
					{
						error_msg='Please select your card type from the drop-down';
					}
				}
			}
			else if(payment_method=='NET_BANKING')
			{
				error_msg='Please choose a bank first';
			}
			else if(payment_method=='PAYPAL')
			{
				error_msg='Please select PayPal option first';
			}
			else if(payment_method=='COD')
			{
				error_msg='Please select the Cash on Delivery option first';
			}

			$('#errror_msg').html(error_msg);
			$('#errror_msg').removeClass("hide");
			//alert(error_msg);
			return false;
			//return true;
		}
	}

	/*code for bank promo start*/
	function savemobilepromoOrder()
	{
		$('button.grn-btn').addClass('active_loader_green');
		//var payment_id = $('.bank_promo_options input:radio[class="bank_promo"]:checked').val();
		var payment_id = $(".bank_promo_options input[type='radio']:checked").val();
		payment_id = parseInt(payment_id);
		

		if (typeof(payment_id) != 'undefined' && payment_id > 0)
		{
			//validated
		}
		else
		{
			$('button.grn-btn').removeClass('active_loader_green');
			//alert('Please Select Payment Option before proceed to pay');
			$('#errror_msg').html('Please Select Payment Option before proceed to pay');
			$('#errror_msg').removeClass("hide");
			return false;
		}
	}
	/*code for bank promo end*/

	function changeShippingValue()
	{
		var radioChecked = $('#codRadio').is(':checked');

		donation=0;
		var donationChecked = $('#mydonation').is(':checked');
		if(donationChecked)
		{
			donation=30;
		}

		if(radioChecked)
		{
			var cod_fee =$('#cod_fee').val();
			var total_pay_amount=$("#cartAmt").val();
			var total=parseInt(total_pay_amount) + parseInt(cod_fee) + donation;
		}
		else
		{
			var online_fee =$('#online_fee').val();
			var total_pay_amount=$("#cartAmt").val();
			var total=parseInt(total_pay_amount) + parseInt(online_fee) + donation;
		}

		$('#final_pay').text(total);
	}

	function returning_mcustomer()
	{
		setTimeout(function(){ 
			//$("#chackoutLogin").fadeIn(0);
			//$('#mcart #checkout').hide();
			$('#chackoutLogin').css('display','block').transition({right:0}, 400, 'linear');
			b_scr_amt = $(document).scrollTop();
			bheight = $(window).height();
			$('#p_main_wrapper').css({'height':bheight+'px','margin-top':'-'+b_scr_amt+'px'});
		}, 0); 
		return false;
	}

	function showPaymentError(id)
	{
		$('#'+id).show();
	}
//suhel functioned end