angular.module('mocs')
.controller('ordersCtrl', [
	'$scope',
	'orders',
	'meals',
	'myService',
	function($scope, orders, meals, myService){
		$scope.orders = orders.orders;
		$scope.meal = myService.getOrder();

		if (!angular.isUndefined($scope.meal)) {
			var x = true;
				angular.forEach($scope.orders, function (order) { 
					if (order.meal_id == $scope.meal.id){ x = false; }
				});
				if(x){
					orders.create({
						meal_id: parseInt($scope.meal.id),
						status: "ordered",
				});
			}
		}

		$scope.deleteOrder = function(order){
			meals.unsold(order.meal);
		  orders.destroy(order);   
		};

		$scope.buyOrder = function(order){
			orders.delivered(order);
		};

		$scope.activeOrder = function(order) { 
			return order.status == "ordered";
		};

		$scope.historyOrder = function(order) { 
			return order.status == "delivered";
		};

		$scope.ordersCount = function(status) {
	    var count = 0;
			angular.forEach($scope.orders, function (order) { 
				if (order.status == status) { count++ }});
			return count; 
		};

		$scope.totalPrice = function(status) {
	    var price = 0;
			angular.forEach($scope.orders, function (order) { 
				if (order.status == status) {
				var a = angular.fromJson(order.meal.cost);
				price += a}});
			return price; 
		};

 }]);