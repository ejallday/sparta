#= require sparta
class GuardiansCtrl
  constructor: ($scope, Guardian) ->
    Guardian.query().then (guardians) ->
      $scope.guardians = guardians

app.controller('GuardiansCtrl', ['$scope', 'Guardian', GuardiansCtrl])
