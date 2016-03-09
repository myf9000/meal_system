angular.module('mocs')
.factory('meals', ['$http',function($http){
  var o = {
  	meals: []
  };

  o.getAll = function() {
    return $http.get('/meals.json')
    .success(function(data){
      angular.copy(data, o.meals);
    });
  };

  o.sold = function(meal) {
		return $http.put('/meals/'+meal.id+'/sold.json')
		.success(function(data){
		meal.active = "false";
		});
	};

	o.unsold = function(meal) {
		return $http.put('/meals/'+meal.id+'/unsold.json')
		.success(function(data){
		meal.active = "true";
		});
	};
	return o;
}]);