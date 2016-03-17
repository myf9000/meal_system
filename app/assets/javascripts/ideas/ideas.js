angular.module('mocs')
.factory('ideas', [ '$http',function($http){
  var o = {
    ideas: []
  };

  o.getAll = function() {
    return $http.get('/ideas.json')
    .success(function(data){
      angular.copy(data, o.ideas);
    });
  };

  o.create = function(idea) {
    return $http.post('/ideas.json', idea)
    .success(function(data){
      o.ideas.push(data);
    });
  };

  o.get = function(id) {
    return $http.get('/ideas/' + id + '.json').then(function(res){
      return res.data;
    });
  };

  return o;
}]);
