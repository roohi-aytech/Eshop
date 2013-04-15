var eshop = angular.module('eshop', []);

eshop.controller('eshopCtrl', function ($scope, $http) {
    $scope.basketCounter = basketCounter;
    $scope.compareListCounter = compareListCounter;
    $scope.wishListCounter = wishListCounter;
    $scope.basket = basket;
    $scope.compareList = compareList;
    $scope.wishList = wishList;
    $scope.contextRoot = contextRoot;

    //    basket
    $scope.addToBasket = function (id, name) {
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
            $scope.basket[$scope.basket.length] = {id: id, name: name, count: 1};
        $http.post(contextRoot + "basket/add/" + id).success(function (response) {
        });

        return false;
    };

    $scope.removeFromBasket = function (id) {
        var found = false;
        for (var i = 0; i < $scope.basket.length; i++) {
            if ($scope.basket[i].id == id) {
                $scope.basketCounter -= $scope.basket[i].count;
                $scope.basket.splice(i, 1);
                found = true;
                break;
            }
        }
        if (found) {
            $http.post(contextRoot + "basket/remove/" + id).success(function (response) {
            });
        }
    };

    $scope.calculateBasketTotalPrice = function () {
        var totalPrice = 0;

        angular.forEach($scope.basket, function (item) {
            totalPrice += item.price * item.count;
        });

        return totalPrice;
    }

    $scope.changeCount = function (id, count) {
        $http.post(contextRoot + "basket/changeCount/" + id + "?count=" + count).success(function (response) {
        });
    }

    //    compareList
    $scope.addToCompareList = function (id, name) {;
        var found = false;
        for (var i = 0; i < $scope.compareList.length; i++) {
            if ($scope.compareList[i].id == id) {
                found = true;
                break;
            }
        }
        if (!found)  {
            $scope.compareList[$scope.compareList.length] = {id: id, title: name};
            $scope.compareListCounter++
        }
        $http.post(contextRoot + "comparison/add/" + id).success(function (response) {
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
    $scope.addToWishList = function (id, name) {
        var found = false;
        for (var i = 0; i < $scope.wishList.length; i++) {
            if ($scope.wishList[i].id == id) {
                found = true;
                break;
            }
        }
        if (!found){
            $scope.wishListCounter++;
            $scope.wishList[$scope.wishList.length] = {id: id, title: name};
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
});
