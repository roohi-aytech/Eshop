var addresses = [];
var INVITER_FILTER_BLANK = INVITER_FILTER_BLANK || 'جستجو';

// Array indexOf compatibility
// https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Array/indexOf
if (!Array.prototype.indexOf) {
    Array.prototype.indexOf = function (searchElement /*, fromIndex */ ) {
        "use strict";
        if (this == null) {
            throw new TypeError();
        }
        var t = Object(this);
        var len = t.length >>> 0;
        if (len === 0) {
            return -1;
        }
        var n = 0;
        if (arguments.length > 1) {
            n = Number(arguments[1]);
            if (n != n) { // shortcut for verifying if it's NaN
                n = 0;
            } else if (n != 0 && n != Infinity && n != -Infinity) {
                n = (n > 0 || -1) * Math.floor(Math.abs(n));
            }
        }
        if (n >= len) {
            return -1;
        }
        var k = n >= 0 ? n : Math.max(len - Math.abs(n), 0);
        for (; k < len; k++) {
            if (k in t && t[k] === searchElement) {
                return k;
            }
        }
        return -1;
    }
}

// Array filter compatibility
// https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Array/filter
if (!Array.prototype.filter)
{
  Array.prototype.filter = function(fun /*, thisp */)
  {
    "use strict";
 
    if (this == null)
      throw new TypeError();
 
    var t = Object(this);
    var len = t.length >>> 0;
    if (typeof fun != "function")
      throw new TypeError();
 
    var res = [];
    var thisp = arguments[1];
    for (var i = 0; i < len; i++)
    {
      if (i in t)
      {
        var val = t[i]; // in case fun mutates this
        if (fun.call(thisp, val, i, t))
          res.push(val);
      }
    }
 
    return res;
  };
}

var invitation = invitation || function() {};

invitation.prototype.onDomReady = function(callback){
    if (document.addEventListener) {
        document.addEventListener('DOMContentLoaded', callback, false);
    } else {
        if(document.body && document.body.lastChild){
            callback();
        } else {
            return setTimeout(arguments.callee, 0);
        }
    }
};

// isNullSafe
invitation.prototype.isUsable = function(variable) {
    return (typeof(variable) != 'undefined' && variable != null);
};

// show friend div. display: inline-block;
invitation.prototype.show = function(element) {
    element.style.display = 'inline-block';
}

invitation.prototype.hide = function(element) {
    element.style.display = 'none';
}

invitation.prototype.text = function(element) {
    var text = document.body.textContent ? 'textContent' : 'innerText';
    return element[text];
}

invitation.prototype.getAllFriends = function() {
    var friends = [];
    var friendsNode = document.getElementById('invitation-friends');
    if (!invitation.isUsable(friendsNode)) { return friends; }
    var els = friendsNode.getElementsByTagName('div');
    var elsLen = els.length;
    for(var i=0; i<elsLen; i++) {
        friends.push(els[i]);
    }
    return friends;
}

// adds or removes elements from the list of addresses
invitation.prototype.toggleAddress = function(address) {
    var addressIdx = addresses.indexOf(address);
    if (addressIdx >= 0) {
        addresses.splice(addressIdx, 1);
        var els = invitation.getByEmail(address);
        var elsLen = els.length;
        for(var i=0; i<elsLen; i++) {
            els[i].className = 'friend';
        }
	} else {
		addresses.push(address);
        var els = invitation.getByEmail(address);
        var elsLen = els.length;
        for(var i=0; i<elsLen; i++) {
            els[i].className = 'friend selected';
        }
	}
    var addressesNode = document.getElementById('addresses');
    if (invitation.isUsable(addressesNode)) {
        addressesNode.value = addresses.join(',');
    }

}

invitation.prototype.getByEmail = function(address) {
    var friends = invitation.getAllFriends();
    return friends.filter(function(node) {
        return node.getAttribute('data-email') == address;
    });
    return [];
}

// function used to add delay to binding search field.
var typewatch = function(){
    var timer = 0;
    return function(callback, ms){
        clearTimeout (timer);
        timer = setTimeout(callback, ms);
    }  
}();


invitation.prototype.bindEvent = function(element, eventType, handler) {
    if (invitation.isUsable(element)) {
        if (typeof element.addEventListener != "undefined") {
            element.addEventListener(eventType, handler, false);
        } else if (typeof element.attachEvent != "undefined") {
            element.attachEvent('on' + eventType, function(){
                 handler.call(event.srcElement,event);
            });
        }
    }
}

invitation.prototype.clearSelection = function() {
    addresses = [];
    var friends = invitation.getAllFriends();
    var elsLen = friends.length;
    for(var i=0; i<elsLen; i++) {
        friends[i].className = 'friend';
    }
    var addressesNode = document.getElementById('addresses');
    if (invitation.isUsable(addressesNode)) {
        addressesNode.value = '';
    }
}

invitation.prototype.selectAll = function() {
    addresses = [];
    var friends = invitation.getAllFriends();
    var elsLen = friends.length;
    for(var i=0; i<elsLen; i++) {
        var friend = friends[i];
        addresses.push(friend.getAttribute('data-email'));
        friend.className = 'friend selected';
    }
    var addressesNode = document.getElementById('addresses');
    if (invitation.isUsable(addressesNode)) {
        addressesNode.value = addresses.join(',');
    }
}

invitation = new invitation();

invitation.onDomReady(function() {
    var friends = invitation.getAllFriends();
    var filterField = document.getElementById('filterField');
    if (!invitation.isUsable(friends) || !invitation.isUsable(filterField)) { return; }
    var friendsSize = friends.length;
    for(var i=0; i<friendsSize; i++) {
        var friend = friends[i];
        invitation.bindEvent(friend, 'click', function(e) {
            invitation.toggleAddress(this.getAttribute('data-email'));
        });
    }
    invitation.bindEvent(filterField, 'focus', function() {
        if (filterField.value == INVITER_FILTER_BLANK) {
            filterField.value = '';
        }
	});
    invitation.bindEvent(filterField, 'focusout', function() {
        if (filterField.value == '') {
            filterField.value = INVITER_FILTER_BLANK;
        }
	});
    invitation.bindEvent(document.getElementById('filterField'), 'keyup', function () {
        typewatch(function() {
            var filterVal = filterField.value;
            if (filterVal == '') {
                for(var i=0; i<friendsSize; i++) {
                    invitation.show(friends[i]);
                }
            } else if (filterVal.length > 0) {
                var rgx = new RegExp(filterVal, "i");
                for(var i=0; i<friendsSize; i++) {
                    var friend = friends[i];
                    (invitation.text(friend).search(rgx) < 0 && friend.getAttribute('data-email').search(rgx) < 0) ? invitation.hide(friend) : invitation.show(friend);
                }
            }
        }, 500 );
    });
    filterField.value = INVITER_FILTER_BLANK;
    invitation.bindEvent(document.getElementById('clearSelection'), 'click', invitation.clearSelection);
    invitation.bindEvent(document.getElementById('selectAll'), 'click', invitation.selectAll);
});
