#= require sparta
class GuardiansCtrl
  constructor: ($scope, Guardian) ->
    Guardian.query().then (guardians) ->
      $scope.guardians = guardians

@controllers.controller('GuardiansCtrl', ['$scope', 'Guardian', GuardiansCtrl])
