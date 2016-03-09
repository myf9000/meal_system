angular.module('mocs')
.controller("mealsCtrl", [
	'$scope', 
	'meals', 
	'myService',
 function($scope, meals, myService) {
  $scope.meals = meals.meals;
  $scope.addMeals = function(meal){
  	myService.setOrder(meal)
  	meals.sold(meal);
  };

  $scope.checkActive = function(meal) { 
		return meal.active == true;
	};
}]);

