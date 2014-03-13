#= require controllers/guardians_ctrl
describe 'GuardiansCtrl', ->
  [$scope, makeController, $q, Guardian] = []

  beforeEach(module('sparta.controllers'))

  beforeEach inject ($controller, $rootScope, _$q_) ->
    $scope = $rootScope.$new()
    $q = _$q_
    Guardian =
      query: -> $q.defer().promise

    makeController = ->
      $controller 'GuardiansCtrl',
        $scope: $scope
        Guardian: Guardian

  it 'exposes Guardian on the scope', ->
    queryGuardian = $q.defer()
    Guardian.query = -> queryGuardian.promise

    makeController()
    queryGuardian.resolve(guardian: {name: 'Bojangles'})
    $scope.$digest()

    expect($scope.guardians).toEqual(guardian: {name: 'Bojangles'})
