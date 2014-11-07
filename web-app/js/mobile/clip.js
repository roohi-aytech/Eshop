// Filters Styling
var checkedpricefilter=false;
var checkedcheckboxfilter=false;
var isCleared = false;
var sFilters = {};

$(document).ready(function(){
	$('#sel-sort').on('change', function(){
		var val = $(this).val().split('-');
		var url = window.location.href.split('#');
		if(typeof url[0] === 'undefined') {
			url = window.location.href.split('?');
		} else {
			url = url[0].split('?');
		}
		var uri = '';
		if(typeof url[1] !== 'undefined') {
			uri = '?' + url[1];
		}
		if(typeof val[0] !== 'undefined' && typeof val[1] !== 'undefined') {
			uri = replaceQueryString(uri, 'p', '1');
			uri = replaceQueryString(uri, 'order', val[0]);
			uri = replaceQueryString(uri, 'dir', val[1]);
			setLocation(uri);
		}
	});
	$('#div-filters').on('click', function(event){
		showFilters($(this).parent());
	});
	$('#div-filters-back').on('click', function(event){
		closeFilterPanel();
	});
	
	$('#filter_slide_panel, .tabs').on('click','.toggle-head', function(event){
		event.preventDefault();
		var curr_id = $(this).prop('id'); 
		var tmp = curr_id.split('-');
		var id = '#toggled-';
		if(typeof tmp[1] !== 'undefined') {
			id += tmp[1];
		}
		$( id ).slideToggle( "slow", function() {
		    // Animation complete.
		    $("#" + curr_id + " .up-arrow").toggleClass("down-arrow");
		});
	});
	
	//check if checkbox is checked
	$(".checked-products input[type=checkbox]").change(function(){
		checked();
	});
	
	// submit the form to filter
	$('.dummy_submit').on('click', function(event){
		event.preventDefault();
		submitFilters();
	});
	
	// making li's of equal height
	if($("#listing-container li").length > 0){
		equalHeight($("#listing-container li"));
		$(window).resize(function(){
			equalHeight($("#listing-container li"));
		});
	}
	
	// Remove all applied filters
	$('.clear-all-filters').on('click', function(event){
		event.stopPropagation();
		var uri = returnUrl();
		setLocation(uri);
	});
	
	
	/*$('.filter-applied').on('click', function(event) {
		showFilters($(this));
	});*/
	
	// clear individual filter
	$('#filter_slide_panel').on('click', '.clear_filter', function(event){
		event.stopPropagation();
		isCleared = true;
		var encapsulator = $(this).parent().parent();
		var prop = $(this).data('url');
		var checkDiv;
		if(prop == "price") {
			sFilters['price'] = {};
			sFilters['price']['head'] = $(this).parent().html();
			sFilters['price']['values'] = {};
			checkdiv = $("#price-filter");
			encapsulator.html('<h2 class="dummy_toggler">By Price</h2>');
			encapsulator.append(checkdiv);
			$('.numb3rs').each(function(){
				sFilters['price']['values'][$(this).prop('id')] = $(this).val();
				$(this).val('');
			});
		} else {
			sFilters[prop] = {};
			sFilters[prop]['head'] = {};
			$.each(encapsulator.children(), function(key, value) {
				if($(value).hasClass('filter-selected')) {
					sFilters[prop]['head'] = $(value).html();
					$(value).remove();
				} else {
					checkDiv = value;
				}
			});
			encapsulator.html('<h2 class="toggle-head dummy_toggler" id="toggle-'+prop+'">By '+attributes[prop]+'<span class="grey"> </span><span class="up-arrow right">dummy</span></h2>');
			encapsulator.append(checkDiv);
			sFilters[prop]['values'] = {};
			$('#toggled-' + prop + ' input[type=checkbox]').each(function(key, value){
				if($(value).is(':checked')) {
					sFilters[prop]['values'][$(value).prop('id')] = 1;
				}
				$(value).prop('checked', false);
			});
		}
		console.log(sFilters);
		filtercondcheck();
	});
	// 
	$('#filter_slide_panel').on('keydown','.numb3rs', function(event){
		numcheck( event );
		var minvalue=$(".min-range").val();
		var maxvalue=$(".max-range").val();
		if((minvalue.length>0) && (maxvalue.length>0)){
			$('#submit-price').prop('disabled', false);
			checkedpricefilter=true;
		} else {
			$('#submit-price').prop('disabled', true);
			checkedpricefilter=false;
		}
		filtercondcheck();
	});
	//price filter - trigger the main submit
	$('#price-filter').on('submit', function(event){
		event.preventDefault();
		submitFilters();
	});
	
	
	// Script for Checkbox selection
	$('.checkbox-group input[type="checkbox"]').change(function(){
		var obj = $(this).parents('form').find(':checkbox');
		var childCount = obj.size();
		var checkedCount = obj.filter(':checked').length;
		$(this).parents('.by-brand').find('.toggle-head .grey').text(' ('+checkedCount+' مورد)');
	});	
	
	if( $('#brandsname_filter_input').length > 0 ) {
		$('#brandsname_filter_input').fastLiveFilter('#frm-brandsname');
	}
	
	$(document).on('click','.bbq', function(event){
		var state = {},
		id = $(this).prop( 'id' );
		state[ 'url' ] 		= $(this).data( 'q' );
		$.bbq.pushState( state );
		event.stopPropagation();
	});
	
	$(window).bind( 'hashchange', function(event) {
		var url = event.getState( "url" );
		if(url === 'filters-back' ){
			$('#div-filters-back').trigger('click');
		}
		
	});
	
	var st = {};
	st[ 'url' ] = 'filters-back';
	$.bbq.pushState( st );
	lazyLoad("img.lazy");
	
});

var submitFilters = function() {
	var uri = returnUrl();
	$('form').each(function(){
		var formId = $(this).prop('id');
		var tmp = formId.split('-');
		var key = '';
		if(typeof tmp[1] !== 'undefined') {
			key = tmp[1];
			var value = new Array();
			$('#' + formId + ' input[type=checkbox]').each(function(i,e){
				if($(e).is(':checked')) {
					value.push($(e).val());
				}
			});
			if(value.length > 0) {
				uri = replaceQueryString(uri,key,value.join(','));
			}
		}
	});
	
	var minvalue=$(".min-range").val();
	var maxvalue=$(".max-range").val();
	if(parseInt(minvalue) > parseInt(maxvalue)) {
		alert('PRICE FILTER ERROR!'); return false;
	} else if((minvalue.length>0) && (maxvalue.length>0)){
		uri = replaceQueryString(uri, 'price', minvalue + ',' + maxvalue);
	}
	setLocation(uri);
}

var filtercondcheck=function(){
	if(checkedcheckboxfilter == true || checkedpricefilter == true || isCleared == true) {
		if($(".filter-grey-btn input[type=submit]").hasClass('hide')) {
			$(".filter-grey-btn input[type=submit]").removeClass('hide');
			$(".filter-grey-btn input[type=button]").addClass('hide');
		}
		$(".filter-grey-btn input[type=submit]").removeAttr('disabled');
		$(".filter-grey-btn input[type=submit]").addClass('light-grn-submit');
		$(".filter-grey-btn input[type=submit]").removeClass('light-grey-submit');
	} else {
		$(".filter-grey-btn input[type=submit]").prop('disabled', true);
		$(".filter-grey-btn input[type=submit]").addClass('light-grey-submit');
		$(".filter-grey-btn input[type=submit]").removeClass('light-grn-submit');
	}
}

function showFilters(element) {
	if(!empty(sFilters)) {
		cancelFilters();
	}
	$('#filter_slide_panel').show();
	$('#filter_slide_panel').animate({left:0},400);
	$('body,html').css('overflow','hidden');
}

function returnUrl() {
	var url = window.location.href.split('#');
	if(typeof url[0] === 'undefined') {
		url = window.location.href.split('?');
	} else {
		url = url[0].split('?');
	}
	var uri = '';
	try {
		if(url[0].indexOf('.html') == -1) {
			uri = replaceQueryString(uri, 'q', term);		
		}
	} catch(e) {}
	
	if(cat > 0) {
		uri = replaceQueryString(uri, 'cat', cat);
	}
	
	uri = replaceQueryString(uri, 'p', '1');
	var val = $('#sel-sort').val().split('-');
	if(typeof val[0] !== 'undefined' && typeof val[1] !== 'undefined') {
		uri = replaceQueryString(uri, 'order', val[0]);
		uri = replaceQueryString(uri, 'dir', val[1]);
	}
	return uri;
}

function checked() {
	var totalchecked=0;
	$(".checked-products input[type=checkbox]:checked").each(function(){
		totalchecked++;
	});
	
	if(totalchecked>0){
		checkedcheckboxfilter=true;
	}else{
		checkedcheckboxfilter=false;
	}
	filtercondcheck();
}

function cancelFilters() {
	$.each(sFilters, function(key, value){
		var main = $("#"+key);
		var attach = false;
		var body = main.html();
		$.each($(body), function(k,v){
			if($(v).hasClass('dummy_toggler')) {
				attach = true;
			}
		});
		if(attach) {
			var head = '<div class="toggle-head filter-selected" id="toggle-'+key+'">' + value['head'] + '</div>';
			$("#"+key).html(head);
			$("#"+key).append(body);
			$("#"+key+" .dummy_toggler").remove("h2");
			var form = $("#"+key).find('form');
			form[0].reset();
		}
	});
	sFilters = {};
}

/*
var ajaxHtml = '';
var url = '';
var faltuCounter = 1;
function elementVisibilityMayChange (el) {
    return function () {
        if ( isElementInViewport(el) ) {
        	//if((parseInt(page)%3) > 0) {
        	if(faltuCounter < 3) {	
        		url = window.location.href;
        		var nextPage = parseInt(page) + 1;
        		url = replaceQueryString(url, 'p', nextPage);
    			$.ajax({
    				'url' : url,
    				beforeSend: function() {
						// overloay the page
					},
					success:function(result) {
						var data = $.parseJSON(result);
						page = data.current_page;
						if(data.html_content && ajaxHtml !== data.html_content) {
							$('#listing-container').append(data.html_content);
							ajaxHtml = data.html_content;
							lazyLoad("img.lazy");
							data.html_content = '';
							faltuCounter++;
							url = replaceQueryString(url, 'p', parseInt(nextPage) + 1);
							if($('.next-page').parent().prop('tagName') == 'A') {
								$('.next-page').parent().prop('href', url);
								$('.next-page').parent().prop('rel', parseInt(nextPage) + 1);
							}
							/ *if($('.prev-page').parent().prop('tagName') == 'A' && (parseInt(initPage) - 1) > 0) {
								var prevUrl = replaceQueryString(url, 'p', parseInt(initPage) - 1);
								$('.prev-page').parent().prop('href', prevUrl);
								$('.prev-page').parent().prop('rel', parseInt(initPage) - 1);
								initPage--;
							}* /
							
							if($('.next').length > 0 && $('.next').parent().prop('tagName') == 'A') {
								if($('.next-page').parent().prop('rel') > $('.next').parent().prop('rel')) {
									$('.next-page').parent().prop('href', $('.next').parent().prop('href'));
								}
							}
			        		return true;
						}
					},
					complete: function(r){
						// remove the overlay
					}
    			});
	        		
        	} else {
        		return false;
        	}
        }
    }
}*/
//var timeout;
//var handler = elementVisibilityMayChange(document.getElementById("rock-bottom"));
//$(window).on('DOMContentLoaded load resize scroll', handler);

function closeFilterPanel(){
    $('#filter_slide_panel').animate({left:'-100%'},400);
    var t = setTimeout(function(){
        $('body,html').css('overflow','auto');
        $('#filter_slide_panel').hide();
        clearTimeout(t);
    },400);
}