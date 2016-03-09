angular.module('mocs', ['ui.router', 'templates', 'ngResource'])
.config([
	'$stateProvider',
	'$urlRouterProvider',
	function($stateProvider, $urlRouterProvider) {

	  $stateProvider
	    .state('orders', {
			    url: '/orders',
			    templateUrl: 'orders/_orders.html',
			    controller: 'ordersCtrl',
			    resolve: {
				  orderPromise: ['orders', function(orders){
				    return orders.getAll();
				  }]
				}
			})
	    .state('meals', {
			  url: '/meals',
			  templateUrl: 'meals/_meals.html',
			  controller: 'mealsCtrl',
			  resolve: {
				  mealPromise: ['meals', function(meals){
				    return meals.getAll();
				  }]
				}
			});

	    $urlRouterProvider.otherwise('meals');
}])
.factory('myService', function() {
	var mealToOrder = {};

	return {
	    setOrder: function(meal) {
	      return mealToOrder.meal = meal;
	    },
	    getOrder: function() {
        	return mealToOrder.meal;
    	}
	};
})
