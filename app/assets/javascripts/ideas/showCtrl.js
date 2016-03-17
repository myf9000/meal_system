angular.module('mocs')
.controller("showCtrl", [
  '$scope',
  'idea',
 function($scope, idea) {
  $scope.idea = idea;
}]);

