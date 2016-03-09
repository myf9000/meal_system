angular.module('mocs')
.factory('orders', [ '$http',function($http){
  var o = {
  	orders: []
  };

  o.getAll = function() {
    return $http.get('/orders.json')
    .success(function(data){
      angular.copy(data, o.orders);
    });
  };

  o.create = function(order) {
	  return $http.post('/orders.json', order)
	  .success(function(data){
	    o.orders.push(data);
	  });
	};

	o.destroy = function(order) {
		return $http.delete('/orders/'+order.id+'.json', order)
		.success(function(data){
			var index = o.orders.indexOf(order);
		  o.orders.splice(index, 1);
		});
	};

	o.delivered = function(order) {
		return $http.put('/orders/'+order.id+'/delivered.json')
		.success(function(data){
			order.status = "delivered";
		});
	};

  return o;
}]);