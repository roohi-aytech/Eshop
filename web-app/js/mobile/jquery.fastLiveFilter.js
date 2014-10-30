/**
 * fastLiveFilter jQuery plugin 1.0.3
 * 
 * Copyright (c) 2011, Anthony Bush
 * License: <http://www.opensource.org/licenses/bsd-license.php>
 * Project Website: http://anthonybush.com/projects/jquery_fast_live_filter/
 **/

jQuery.fn.fastLiveFilter = function(list, options) {
	// Options: input, list, timeout, callback
	options = options || {};
	list = jQuery(list);
	var input = this;
	var lastFilter = '';
	var timeout = options.timeout || 0;
	var callback = options.callback || function() {};
	
	var keyTimeout;
	
	// NOTE: because we cache lis & len here, users would need to re-init the plugin
	// if they modify the list in the DOM later.  This doesn't give us that much speed
	// boost, so perhaps it's not worth putting it here.
	var lis = list.children();
	var len = lis.length;
	var oldDisplay = len > 0 ? lis[0].style.display : "block";
	callback(len); // do a one-time callback on initialization to make sure everything's in sync
	
	$( "div.test" ).on({
		  click: function() {
		    $( this ).toggleClass( "active" );
		  }, mouseenter: function() {
		    $( this ).addClass( "inside" );
		  }, mouseleave: function() {
		    $( this ).removeClass( "inside" );
		  }
		});
	
	
	
	$(document).on('change',input, function(){
		// var startTime = new Date().getTime();
		var filter = input.val().toLowerCase();
		if(filter.length == 0) {
			$(".highlighted").removeClass("highlighted").removeClass("match");
		}
		var li, innerText;
		var numShown = 0;
		for (var i = 0; i < len; i++) {
			li = lis[i];
			innerText = !options.selector ? 
				(li.textContent || li.innerText || "") : 
				$(li).find(options.selector).text();
			if (innerText.toLowerCase().indexOf(filter) >= 0) {
				if (li.style.display == "none") {
					li.style.display = oldDisplay;
				}
				if (!searchAndHighlight(filter,"#span_" + $(li).attr('for') )) {
					//console.log("No results found");
				}
				numShown++;
			} else {
				if (li.style.display != "none") {
					li.style.display = "none";
				}
			}
		}
		
		callback(numShown);
		// var endTime = new Date().getTime();
		// console.log('Search for ' + filter + ' took: ' + (endTime - startTime) + ' (' + numShown + ' results)');
		return false;
	});
	
	$(document).on('keydown',input, function(){
		clearTimeout(keyTimeout);
		keyTimeout = setTimeout(function() {
			if( input.val() === lastFilter ) return;
			lastFilter = input.val();
			input.change();
		}, timeout);
	});
	
	/*
	input.change(function() {
		// var startTime = new Date().getTime();
		var filter = input.val().toLowerCase();
		var li, innerText;
		var numShown = 0;
		for (var i = 0; i < len; i++) {
			li = lis[i];
			innerText = !options.selector ? 
				(li.textContent || li.innerText || "") : 
				$(li).find(options.selector).text();
			
			if (innerText.toLowerCase().indexOf(filter) >= 0) {
				if (li.style.display == "none") {
					li.style.display = oldDisplay;
				}
				numShown++;
			} else {
				if (li.style.display != "none") {
					li.style.display = "none";
				}
			}
		}
		callback(numShown);
		// var endTime = new Date().getTime();
		// console.log('Search for ' + filter + ' took: ' + (endTime - startTime) + ' (' + numShown + ' results)');
		return false;
	}).keydown(function() {
		clearTimeout(keyTimeout);
		keyTimeout = setTimeout(function() {
			if( input.val() === lastFilter ) return;
			lastFilter = input.val();
			input.change();
		}, timeout);
	});
	*/
	return this; // maintain jQuery chainability
}


function searchAndHighlight(searchTerm, selector) {
    if (searchTerm) {
        //var wholeWordOnly = new RegExp("\\g"+searchTerm+"\\g","ig"); //matches whole word only
        //var anyCharacter = new RegExp("\\g["+searchTerm+"]\\g","ig"); //matches any word with any of search chars characters
        var selector = selector || "#realTimeContents"; //use body as selector if none provided
        var searchTermRegEx = new RegExp(searchTerm, "ig");
        var matches = $(selector).text().match(searchTermRegEx);
        if (matches != null && matches.length > 0) {
            $('.highlighted').removeClass('highlighted'); //Remove old search highlights  

            //Remove the previous matches
            $span = $('#realTimeContents span');
            $span.replaceWith($span.html());
                       
            var contentBefore = "<span class='match'>";
            var contentAfter = "</span>";
            var replaced = $(selector).text().replace(searchTermRegEx, function(m){return contentBefore + m + contentAfter});
            $(selector).html(replaced);
            $('.match:first').addClass('highlighted');
            
            return true;
        }
    }
    return false;
}

$(document).on('click', '.searchButtonClickText_h', function (event) {

    $(".highlighted").removeClass("highlighted").removeClass("match");
    if (!searchAndHighlight($('.textSearchvalue_h').val())) {
        //alert("No results found");
    }


});
