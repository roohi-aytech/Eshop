var eshop = angular.module('eshop', []);

eshop.controller('eshopCtrl', function ($scope, $http) {
    $scope.basketCounter = basketCounter;
    $scope.compareListCounter = compareListCounter;
    $scope.wishListCounter = wishListCounter;
    $scope.basket = basket;
    $scope.deliveryPrice = -1;
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
    $scope.visibleItems = function () {
        var result = [];
        if ($scope.basket.length > 0)
            result[0] = $scope.basket[0];
        if ($scope.basket.length > 1)
            result[1] = $scope.basket[1];
        if ($scope.basket.length > 2)
            result[2] = $scope.basket[2];
        if ($scope.basket.length > 3)
            result[3] = $scope.basket[3];
        return result;
    }
    $scope.invisibleItemsCount = function () {
        var result = $scope.basketCounter;
        if ($scope.basket.length > 0)
            result = result - $scope.basket[0].count;
        if ($scope.basket.length > 1)
            result = result - $scope.basket[1].count;
        if ($scope.basket.length > 2)
            result = result - $scope.basket[2].count;
        if ($scope.basket.length > 3)
            result = result - $scope.basket[3].count;
        return result;
    }

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

    $scope.reloadProductImages = function (url, serializedData, imagesContainer) {
        $http({
            url: url,
            method: "POST",
            data: serializedData,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).success(function (data, status, headers, config) {
            imagesContainer.html(data);
        }).error(function (data, status, headers, config) {
            console.error(
                    "The following error occured: " +
                    textStatus, errorThrown
            );
        });
    }

    $scope.reloadProductShoppingPanel = function (url, serializedData, shoppingPanel) {
        $http({
            url: url,
            method: "POST",
            data: serializedData,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).success(function (data, status, headers, config) {
            shoppingPanel.html(data);
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
    $scope.addToBasket = function (id, name, price, selectedAddedValues, count, type, productId, animate) {
        if (!count)
            count = 1;
        $('#link-basket').removeClass('open').addClass('full');

        $('#basketItems .rollbar-path-vertical').remove();
        $('#basketItems .rollbar-path-horizontal').remove();
        $('#basketItems .rollbar-content li').unwrap();
        $('#basketItems .scrollable').rollbar({zIndex: 80, wheelSpeed: 10});

        $scope.basketCounter = $scope.basketCounter + count;
        var found = false;
        for (var i = 0; i < $scope.basket.length; i++) {
            if ($scope.basket[i].id == id) {
                $scope.basket[i].count = $scope.basket[i].count + count;
                found = true;
                break;
            }
        }
        if (!found)
            $scope.basket[$scope.basket.length] = {id: id, name: name, count: count, realPrice: price};
        $http.post(contextRoot + "basket/add/" + id + "?count=" + count + "&addedValues=" + selectedAddedValues.toString() + "&type=" + type).success(function (response) {
        });


        if (animate) {
            var item = $('#productThumbnail_' + id);
            var movingItem = item.clone()
                .css('position', 'absolute')
                .css('top', item.offset().top)
                .css('left', item.offset().left - 14)
                .css('width', 239)
                .css('background', 'white')
                .css('z-index', '999999999');
            $('body').append(movingItem);
            var basketObject = $('#link-basket');
            var top = basketObject.offset().top - 200;
//            window.alert(basketObject.offset().left);
            var left = basketObject.offset().left - 130;
            $('#link-basket').qtip('hide');
            movingItem.animate({
                'top': top,
                'left': left,
                'opacity': 0.5,
                transform: 'scale(0.1,0.1)'
            }, 1000, function () {
                $(this).remove();
                $('#link-basket').qtip('show');
            });
        }

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

    $scope.itemFirstLine = function (name) {
        return name.split('<br/>')[0];
    }

    $scope.itemSecondLine = function (name) {
        return name.split('<br/>')[1];
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
            totalPrice += $scope.deliveryPrice

        return totalPrice;
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

