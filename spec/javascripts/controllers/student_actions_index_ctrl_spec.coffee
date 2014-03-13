#= require controllers/student_actions_index_ctrl
describe 'StudentActionsIndexCtrl', ->
  [$scope, makeController, StudentAction, CurrentCourse, $q] = []

  beforeEach(module('sparta.controllers'))

  beforeEach inject ($controller, $rootScope, _$q_) ->
    $scope = $rootScope.$new()
    $q = _$q_

    StudentAction = query: -> $q.when()
    CurrentCourse =
      id: ->
      get: -> $q.when()

    makeController = ->
      $controller 'StudentActionsIndexCtrl',
        $scope: $scope
        StudentAction: StudentAction
        CurrentCourse: CurrentCourse
        matchInputAllowingAny: ->

  it 'exposes the student actions to the scope', ->
    queryStudentActions = $q.defer()
    StudentAction.query = -> queryStudentActions.promise

    makeController()
    queryStudentActions.resolve(student_actions: ['foo', 'bar'])
    $scope.$digest()

    expect($scope.studentActions).toEqual(student_actions: ['foo', 'bar'])

