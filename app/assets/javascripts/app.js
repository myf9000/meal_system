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
			})
			.state('ideas', {
			  url: '/ideas',
			  templateUrl: 'ideas/_ideas.html',
			  controller: 'ideasCtrl',
			  resolve: {
				  ideaPromise: ['ideals', function(ideals){
				    return ideals.getAll();
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
.factory('myIdea', function() {
	var myIdea = {};

	return {
	    setIdea: function(idea) {
	      return myIdea.idea = idea;
	    },
	    getIdea: function() {
        	return myIdea.idea;
    	}
	};
})
