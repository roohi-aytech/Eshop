var eshop = angular.module('eshop', []);

eshop.controller('eshopCtrl', function ($scope, $http) {
    $scope.btnClasses = ['warning','info','success','primary'];

    $scope.basketCounter = basketCounter;
    $scope.compareListCounter = compareListCounter;
    $scope.wishListCounter = wishListCounter;
    $scope.basket = basket;
    $scope.deliveryPrice = deliveryPrice;
    $scope.deliveryTitle  = '';
    $scope.sendFactor = sendFactor;
    $scope.customerAccountValue = customerAccountValue;
    $scope.useGolBon = customerAccountValue>0;
    $scope.golbonDiscount = golbonDiscount;
    $scope.deliveryMethod = deliveryMethod;
    $scope.buyerName = buyerName;
    $scope.buyerPhone = buyerPhone;
    $scope.buyerEmail = buyerEmail;
    $scope.paymentType = paymentType;
    $scope.deliveryAddress = deliveryAddress;
    $scope.deliveryAddressLine = deliveryAddressLine;
    $scope.deliveryCity = deliveryCity;
    $scope.deliveryName = deliveryName;
    $scope.deliveryPhone = deliveryPhone;
    $scope.callBeforeSend = callBeforeSend;

    $scope.cities = cities;

    $scope.compareList = compareList;
    $scope.wishList = wishList;
    $scope.wishListEnabled = wishListEnabled;
    $scope.contextRoot = contextRoot;

    //slides
    $scope.mainSlides = mainSlides;
    $scope.mainSlideSize = mainSlideSize;
    $scope.mainSlideWidth = mainSlideWidth;
    $scope.mainSlideHeight = mainSlideHeight;

    $scope.specialSaleSlides = specialSaleSlides;
    $scope.specialSaleSlideSize = specialSaleSlideSize;
    $scope.specialSaleSlideWidth = specialSaleSlideWidth;
    $scope.specialSaleSlideHeight = specialSaleSlideHeight;

//    product cart
    $scope.reloadProductCart = function (url, serializedData, productCard) {
        $http({
            url: url,
            method: "POST",
            data: serializedData,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).success(function (data, status, headers, config) {
                productCard.html(data);
            }).error(function (data, status, headers, config) {
                console.error(
                    "The following error occured: " +
                        textStatus, errorThrown
                );
            });
    }
    $scope.reloadProductAdditives = function (url, serializedData, productAdditives) {
        $http({
            url: url,
            method: "POST",
            data: serializedData,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).success(function (data, status, headers, config) {
                productAdditives.html(data);
            }).error(function (data, status, headers, config) {
                console.error(
                    "The following error occured: " +
                        textStatus, errorThrown
                );
            });
    }
    $scope.reloadAjax = function (url, serializedData, container) {
        $http({
            url: url,
            method: "POST",
            data: serializedData,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).success(function (data, status, headers, config) {
            container.html(data);
        }).error(function (data, status, headers, config) {
            console.error(
                    "The following error occured: " +
                    textStatus, errorThrown
            );
        });
    }

    $scope.reloadProductPrice = function (url, serializedData, productPrice) {
        $http({
            url: url,
            method: "POST",
            data: serializedData,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).success(function (data, status, headers, config) {
                productPrice.html(data);
            }).error(function (data, status, headers, config) {
                console.error(
                    "The following error occured: " +
                        textStatus, errorThrown
                );
            });
    }

    //    basket
    $scope.addToBasket = function (id, name, price, selectedAddedValues) {
        $('#link-basket').removeClass('open').addClass('full');

        $('#basketItems .rollbar-path-vertical').remove();
        $('#basketItems .rollbar-path-horizontal').remove();
        $('#basketItems .rollbar-content li').unwrap();
        $('#basketItems .scrollable').rollbar({zIndex: 80, wheelSpeed: 10});

        $scope.basketCounter++;
        var found = false;
        for (var i = 0; i < $scope.basket.length; i++) {
            if ($scope.basket[i].id == id) {
                $scope.basket[i].count++;
                found = true;
                break;
            }
        }
        if (!found)
            $scope.basket[$scope.basket.length] = {id: id, name: name, count: 1, realPrice: price};
            $http.post(contextRoot + "basket/add/" + id + "?addedValues=" + selectedAddedValues.toString()).success(function (response) {
        });

        $.ajax({ url: contextRoot + "basket/alert/" + id })
            .done(function (html) {
                $('#link-basket').qtip({
                    content: {
                        title: '<img src="'+contextRoot+'images/goldaan/logo.png" class="alertlogo">',
                        text: html,
                        button: 'Close'
                    },
                    style: {
                        classes: 'qtip-bootstrap',
                        width: 400
                    },
                    position: {
                        my: 'top center',
                        at: 'bottom center'
                    },
                    show: {
                        ready: true,
                        event: 'ready',
                        effect: function (offset) {
                            $(this).slideDown(100);
                        }
                    },
                    hide: {
                        event: ''
                    },
                    metadata: {
                        type: 'html5'
                    }
                });
            });


        return false;
    };

    $scope.removeFromBasket = function (id, callback) {
        var found = false;
        for (var i = 0; i < $scope.basket.length; i++) {
            if ($scope.basket[i].id == id) {
                $scope.basketCounter -= parseInt($scope.basket[i].count);
                $scope.basket.splice(i, 1);
                found = true;
                break;
            }
        }
        if (found) {
            $http.post(contextRoot + "basket/remove/" + id).success(function (response) {
                if(callback){
                    callback();
                }
            });
        }
    };
    $scope.removeAddedValueFromBasket = function (id,typeId, callback) {
        var found = false;
        for (var i = 0; i < $scope.basket.length; i++) {
            if ($scope.basket[i].id == id) {
                for (var j in $scope.basket[i].selectedAddedValueInstances) {
                    if(j==typeId) {
                        delete $scope.basket[i].selectedAddedValueInstances[j];
                        found = true;
                        break;
                    }
                }
            }
        }
        if (found) {
            $http.post(contextRoot + "basket/removeAddedValue/" + id+'?typeId='+typeId).success(function (response) {
                basket=response;
                $scope.basket = basket;
//                $scope.$apply();
                if(callback){
                    callback();
                }
            });
        }
    };

    $scope.itemFirstLine = function(name){
        return name.split('<br/>')[0];
    }

    $scope.itemSecondLine = function(name){
        return name.split('<br/>')[1];
    }
    $scope.itemThirdLine = function(name){
        return name.split('<br/>')[2];
    }

    $scope.calculateBasketTotalPrice = function () {
        var totalPrice = 0;

        angular.forEach($scope.basket, function (item) {
            totalPrice += item.realPrice * item.count;
        });

        return totalPrice;
    }

    $scope.calculateBasketPayablePrice = function () {
        var totalPrice = 0;

        angular.forEach($scope.basket, function (item) {
            totalPrice += item.realPrice * item.count;
        });

        if ($scope.deliveryPrice > -1)
            totalPrice += $scope.deliveryPrice;

        if($scope.useGolBon)
            totalPrice-=$scope.customerAccountValue;

        return Math.max(totalPrice,0);
    }

    $scope.changeCount = function (id, count, callback) {

        var found = false;
        for (var i = 0; i < $scope.basket.length; i++) {
            if ($scope.basket[i].id == id) {
                $scope.basketCounter -= parseInt($scope.basket[i].count);
                $scope.basket[i].count = parseInt(count);
                $scope.basketCounter += parseInt($scope.basket[i].count);
                $scope.$apply();
                found = true;
                break;
            }
        }

        if (found)
            $http.post(contextRoot + "basket/changeCount/" + id + "?count=" + count).success(function (response) {
                if(callback){
                    callback();
                }
            });
    }

    //    compareList
    $scope.addToCompareList = function (id, name, price) {
        var found = false;

        if ($scope.compareListCounter == 0)
            $('#compareListItems .scrollable').rollbar({zIndex: 80, wheelSpeed: 10});

        for (var i = 0; i < $scope.compareList.length; i++) {
            if ($scope.compareList[i].id == id) {
                found = true;
                break;
            }
        }
        if (!found) {
            $scope.compareList[$scope.compareList.length] = {id: id, title: name, price: price};
            $scope.compareListCounter++
        }
        $http.post(contextRoot + "comparison/add/" + id).success(function (response) {
            $.ajax({ url: contextRoot + "comparison/alert/" + id })
                .done(function (html) {
                    $('#link-compare').qtip({
                        content: {
                            title: 'توجه',
                            text: html,
                            button: 'Close'
                        },
                        style: {
                            classes: 'qtip-bootstrap',
                            width: 410
                        },
                        position: {
                            my: 'top center',
                            at: 'bottom center'
                        },
                        show: {
                            ready: true,
                            event: 'ready',
                            effect: function (offset) {
                                $(this).slideDown(100);
                            }
                        },
                        hide: {
                            event: ''
                        },
                        metadata: {
                            type: 'html5'
                        }
                    });
                });
        });


        return false;
    };

    $scope.removeFromCompareList = function (id) {
        var found = false;
        for (var i = 0; i < $scope.compareList.length; i++) {
            if ($scope.compareList[i].id == id) {
                $scope.compareListCounter -= 1;
                $scope.compareList.splice(i, 1);
                found = true;
                break;
            }
        }
        if (found) {
            $http.post(contextRoot + "comparison/remove/" + id).success(function (response) {
            });
        }
    };

    //    wishList
    $scope.addToWishList = function (id, name, price) {
        if (!$scope.wishListEnabled) {
            $.msgGrowl({
                type: 'warning', 'text': wishListNotEnabledMessage, lifetime: 5000
            });
            return;
        }

        if ($scope.wishListCounter == 0)
            $('#wishListItems .scrollable').rollbar({zIndex: 80, wheelSpeed: 10});

        var found = false;
        for (var i = 0; i < $scope.wishList.length; i++) {
            if ($scope.wishList[i].id == id) {
                found = true;
                break;
            }
        }
        if (!found) {
            $scope.wishListCounter++;
            $scope.wishList[$scope.wishList.length] = {id: id, title: name, price: price};
        }
        $http.post(contextRoot + "wishList/add/" + id).success(function (response) {
        });

        return false;
    };

    $scope.removeFromWishList = function (id) {
        var found = false;
        for (var i = 0; i < $scope.wishList.length; i++) {
            if ($scope.wishList[i].id == id) {
                $scope.wishListCounter -= 1;
                $scope.wishList.splice(i, 1);
                found = true;
                break;
            }
        }
        if (found) {
            $http.post(contextRoot + "wishList/remove/" + id).success(function (response) {
            });
        }
    };

//    common functions
    $scope.isEmpty = function (value) {
        return !value || value.toString().length == 0;
    }
});

function updateBasketItemCount(id, count, callback) {
    var scope = angular.element(document.getElementById('main-container')).scope();
    scope.changeCount(id, count, callback);
}

function removeFromBasket(id, callback) {
    var scope = angular.element(document.getElementById('main-container')).scope();
    scope.removeFromBasket(id, callback);
}
function removeAddedValue(id,typeId, callback) {
    $('.added-value-instance').qtip('destroy');
    var scope = angular.element(document.getElementById('main-container')).scope();
    scope.removeAddedValueFromBasket(id,typeId, callback);
}
function updateDescriptionAndDeliverMethod() {
    var scope = angular.element(document.getElementById('main-container')).scope();
    if(scope.deliveryMethod) {

        var data = {
            deliveryMethod: scope.deliveryMethod,
            deliveryPrice: scope.deliveryPrice
        };
        $('.basket-item-description').each(function () {
            data[this.name] = this.value;
        });

        $.ajax({
            url: contextRoot + 'basket/updateDescriptionAndDelivery',
            data: data,
            type: 'post'
        });
        $('.steps .selected').removeClass('selected');
        $('.step-content.selected').removeClass('selected');
        $('.steps .step2').addClass('selected');
        $('.step-content.step2').addClass('selected');
    }
    else{
        showAlert('.delivery-methods span:first','لطفا روش ارسال را انتخاب فرمایید')
    }
}
function updateBuyerAndPaymentTypeAndSendFactor() {
    var scope = angular.element(document.getElementById('main-container')).scope();
    if(scope.buyerName) {
        var data = {
            paymentType: scope.paymentType,
            buyerName: scope.buyerName,
            sendFactor: scope.sendFactor
        };


        $.ajax({
            url: contextRoot + 'basket/updateBuyerAndPaymentTypeAndSendFactor',
            data: data,
            type: 'post'
        });
        $('.steps .selected').removeClass('selected');
        $('.step-content.selected').removeClass('selected');
        $('.steps .step3').addClass('selected');
        $('.step-content.step3').addClass('selected');
    }
    else{
        showAlert('#buyerName','لطفا نام خریدار را وارد فرمایید')
    }
}
function basketReview(){
    changeStep(1);
}
function factorReview(){
    changeStep(2)
}
function deliveryReview(){
    changeStep(3)
}
function updateDeliveryInfo(){
    var scope = angular.element(document.getElementById('main-container')).scope();
    if(!scope.deliveryName){
        showAlert('#deliveryName','لطفا نام تحویل گیرنده را وارد فرمایید')
        return false;
    }
    else if(!scope.deliveryPhone){
        showAlert('#deliveryPhone','لطفا تلفن تحویل گیرنده را وارد فرمایید')
        return false;
    }
    else if(!scope.deliveryAddressLine){
        showAlert('#deliveryAddressLine','لطفا آدرس تحویل را وارد فرمایید')
        return false;
    }
    else {
        var data = {
            callBeforSend: scope.callBeforeSend,
            deliveryName: scope.deliveryName,
            deliveryAddressLine: scope.deliveryAddressLine,
            deliveryPhone: scope.deliveryPhone
        };


        $.ajax({
            url: contextRoot + 'basket/updateDeliveryInfo',
            data: data,
            type: 'post'
        });
        $('.steps .selected').removeClass('selected');
        $('.step-content.selected').removeClass('selected');
        $('.steps .step4').addClass('selected');
        $('.step-content.step4').addClass('selected');
        return true;
    }
}
//function updateBuyerAndPaymentTypeAndSendFactor() {
//    var scope = angular.element(document.getElementById('main-container')).scope();
//    var data={
//        paymentType:scope.paymentType,
//        buyerName:scope.buyerName,
//        sendFactor:scope.sendFactor
//    };
//
//
//    $.ajax({
//        url:contextRoot+'basket/updateBuyerAndPaymentTypeAndSendFactor',
//        data:data,
//        type:'post'
//    });
//    $('.steps .selected').removeClass('selected');
//    $('.step-content.selected').removeClass('selected');
//    $('.steps .step3').addClass('selected');
//    $('.step-content.step3').addClass('selected');
//
//}
function updateBuyerInfo() {
    var scope = angular.element(document.getElementById('main-container')).scope();
    if(!scope.buyerPhone){
        showAlert('#buyerPhone','لطفا تلفن را وارد فرمایید')
        return false;
    }
    else if (!scope.buyerEmail){
        showAlert('#buyerEmail','لطفا پست الکترونیک را وارد فرمایید')
        return false;
    }
    else {
        var data = {
            buyerPhone: scope.buyerPhone,
            buyerEmail: scope.buyerEmail
        };


        $.ajax({
            url: contextRoot + 'basket/updateBuyerInfo',
            data: data,
            type: 'post'
        });
        return true;
    }
}

function changeStep(i){
    $.ajax({
        url:contextRoot+'basket/changeStep/'+i,
        type:'post'
    });
    $('.steps .selected').removeClass('selected');
    $('.step-content.selected').removeClass('selected');
    $('.steps .step'+i).addClass('selected');
    $('.step-content.step'+i).addClass('selected');
}
function updateDeliveryAddressesJs(id){
    var scope = angular.element(document.getElementById('main-container')).scope();
    if(!id){
        scope.deliveryAddressLine = '';
        scope.deliveryName = '';
        scope.deliveryPhone = '';
        scope.deliveryCity = '';
    }
    else {
        for (var i in deliveryAddresses) {
            if (deliveryAddresses[i].id == id) {
                scope.deliveryAddressLine = deliveryAddresses[i].addressLine1;
                scope.deliveryName = deliveryAddresses[i].title;
                scope.deliveryPhone = deliveryAddresses[i].telephone;
                scope.deliveryCity = deliveryAddresses[i].city.id;


            }
        }
    }
}
function finalizeBasket(btn){
    //$('#finalizebasket').submit()
    $('.factor').qtip({
        content:$('#confirm-dialog').html(),
        position: {
            my: 'top left',
            at: 'top right'
        },
        style: {
            classes: 'qtip-bootstrap qtip-added-value',
            width: 700
        },
        show: {
            ready: true,
            event: 'ready',
            effect: function (offset) {
                $(this).slideDown(100);
            }
        }

    });
}
function showAlert(selector,text){
    $(selector).qtip({
        content:text,
        position: {
            my: 'center right',
            at: 'center left'
        },
        show: {
            ready: true,
            event: 'ready',
            effect: function (offset) {
                $(this).slideDown(100);
            }
        }
    });
}

