var eshop = angular.module('eshop', []);

eshop.controller('eshopCtrl', function($scope, $http) {
    $scope.basketCounter = basketCounter;
    $scope.basket = basket;

    $scope.addToBasket = function(id, name) {
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
        $http.post(contextRoot + "basket/add/" + id).success(function(response) {});
    };

    $scope.removeFromBasket = function(id) {
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
            $http.post(contextRoot + "basket/remove/" + id).success(function(response) {});
        }
    };
});
