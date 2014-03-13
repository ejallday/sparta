#= require controllers/courses_ctrl
describe 'CoursesCtrl', ->
  [$scope, makeController, $q, Course] = []

  beforeEach(module('sparta.controllers'))

  beforeEach inject ($controller, $rootScope, _$q_) ->
    $scope = $rootScope.$new()
    $q = _$q_
    Course =
      query: -> $q.defer().promise

    makeController = ->
      $controller 'CoursesCtrl',
        $scope: $scope
        Course: Course

  it 'exposes the courses to the scope', ->
    queryCourses = $q.defer()
    Course.query = -> queryCourses.promise

    makeController()
    queryCourses.resolve(courses: [1, 2, 3])
    $scope.$digest()

    expect($scope.courses).toEqual(courses: [1, 2, 3])

  describe '#semiStrict', ->
    it 'returns true if the filtering parameter is blank', ->
      makeController()

      expect($scope.semiStrict('anything', null)).toBeTruthy()

    it 'returns false if the filtering parameter is present and the comparing object does not match', ->
      makeController()

      expect($scope.semiStrict('anything', 'something')).toBeFalsy()

    it 'returns true if the filtering parameter and the comparing object are equal', ->
      makeController()

      expect($scope.semiStrict('anything', 'anything')).toBeTruthy()
