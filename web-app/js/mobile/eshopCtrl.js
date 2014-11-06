var eshop = angular.module('eshop', []);

eshop.controller('eshopCtrl', function ($scope, $http) {
    $scope.basketCounter = basketCounter;
    $scope.basket = basket;
    $scope.wishListCounter = wishListCounter;
    $scope.wishList = wishList;
    $scope.deliveryPrice = -1;
    $scope.contextRoot = contextRoot;

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
        $('#add_cart').addClass('active_loader_green');
        $http.post(contextRoot + "basket/add/" + id + "?count=" + count + "&addedValues=" + selectedAddedValues.toString() + "&type=" + type).success(function (response) {
            $('#add_cart').removeClass('active_loader_green');
            $('body,html').animate({scrollTop: 0}, 500);
            $('#cart_msg').show().delay(10000).fadeOut();

            var cart_count = $('#mshow_item_total').text();
            if (parseInt(cart_count) > 0) {
                var footer = '<div class="acnt-btn"><h3>Your Cart(' + cart_count + ')</h3></div>';
                $('#a-footer-cart').html(footer).removeClass('hide');
            } else {
                var footer = '';
                $('#a-footer-cart').html(footer).addClass('hide');
            }
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

                if (callback) {
                    callback();
                }
            });
        }
    };


    $scope.calculateBasketTotalPrice = function () {
        var totalPrice = 0;

        angular.forEach($scope.basket, function (item) {
            totalPrice += item.realPrice * item.count;
        });

        return totalPrice;
    }

    $scope.itemFirstLine = function (name) {
        return name.split('<br/>')[0];
    }

    $scope.itemSecondLine = function (name) {
        return name.split('<br/>')[1];
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
                if (callback) {
                    callback();
                }
            });
    };

    $scope.increaseCount = function (id, callback) {

        var count;
        var found = false;
        for (var i = 0; i < $scope.basket.length; i++) {
            if ($scope.basket[i].id == id) {
                $scope.basketCounter++;
                $scope.basket[i].count++;
                count = $scope.basket[i].count;
//                $scope.$apply();
                found = true;
                break;
            }
        }

        if (found)
            $http.post(contextRoot + "basket/changeCount/" + id + "?count=" + count).success(function (response) {
                if (callback) {
                    callback();
                }
            });
    };

    $scope.decreaseCount = function (id, callback) {

        var count;
        var found = false;
        for (var i = 0; i < $scope.basket.length; i++) {
            if ($scope.basket[i].id == id) {
                $scope.basketCounter--;
                $scope.basket[i].count--;
                count = $scope.basket[i].count;
//                $scope.$apply();
                found = true;
                break;
            }
        }

        if (found)
            $http.post(contextRoot + "basket/changeCount/" + id + "?count=" + count).success(function (response) {
                if (callback) {
                    callback();
                }
            });
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
    var scope = angular.element(document.body).scope();
    scope.changeCount(id, count, callback);
}

function removeFromBasket(id, callback) {
    var scope = angular.element(document.body).scope();
    scope.removeFromBasket(id, callback);
}

