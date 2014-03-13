#= require controllers/roll_call_ctrl
describe 'RollCallCtrl', ->
  [$scope, makeController, $q, CurrentCourse, RollCall, $window] = []

  beforeEach(module('sparta.controllers'))

  beforeEach inject ($controller, $rootScope, _$q_) ->
    $scope = $rootScope.$new()
    $q = _$q_
    $window = {}
    CurrentCourse =
      id: ->
    RollCall =
      get: -> $q.defer().promise

    makeController = ->
      $controller 'RollCallCtrl',
        $scope: $scope
        $window: $window
        CurrentCourse: CurrentCourse
        RollCall: RollCall

  it 'exposes the roll call on the scope', ->
    getRollCall = $q.defer()
    RollCall.get = -> getRollCall.promise

    makeController()
    getRollCall.resolve(attendances: [1, 2, 3])
    $scope.$digest()

    expect($scope.rollCall).toEqual(attendances: [1, 2, 3])

  it 'updates a roll call', ->
    rollCall =
      update: jasmine.createSpy('update').andReturn($q.defer().promise)

    makeController()
    $scope.saveRollCall(rollCall)

    expect(rollCall.update).toHaveBeenCalled()

  it 'redirects to the course page', ->
    saveRollCall = $q.defer()
    rollCall =
      courseId: 3
      update: -> saveRollCall.promise

    makeController()
    $scope.saveRollCall(rollCall)
    saveRollCall.resolve(rollCall)
    $scope.$digest()

    expect($window.location).toEqual('/teachers/courses/3')

  it 'cycles through attendance statuses', ->

