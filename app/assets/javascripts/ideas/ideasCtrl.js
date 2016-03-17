angular.module('mocs')
.controller("ideasCtrl", [
  '$scope',
  'ideas',
  'myIdea',
 function($scope, ideas, myIdea) {
  $scope.ideas = ideas.ideas;

  $scope.addIdea = function(){
    if(!$scope.name || $scope.name === '') { return; }
    ideas.create({
      name: $scope.name,
      desc: $scope.desc,
    });
    $scope.name = '';
    $scope.desc = '';
  };

}]);

