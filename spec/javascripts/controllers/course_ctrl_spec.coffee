#= require controllers/course_ctrl
describe 'CourseCtrl', ->
  [$scope, makeController, $q, CurrentCourse] = []

  beforeEach(module('sparta.controllers'))

  beforeEach inject ($controller, $rootScope, _$q_) ->
    $scope = $rootScope.$new()
    $q = _$q_
    CurrentCourse =
      get: -> $q.defer().promise

    makeController = ->
      $controller 'CourseCtrl',
        $scope: $scope
        CurrentCourse: CurrentCourse

  it 'gets the current course', ->
    spyOn(CurrentCourse, 'get').andReturn($q.defer().promise)

    makeController()
    expect(CurrentCourse.get).toHaveBeenCalled()

  it 'exposes Course on the scope', ->
    getCourse = $q.defer()
    CurrentCourse.get = -> getCourse.promise

    makeController()
    getCourse.resolve(course: {thing: 1})
    $scope.$digest()

    expect($scope.course).toEqual(course: {thing: 1})
