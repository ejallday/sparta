#= require controllers/teachers_ctrl
describe 'TeachersCtrl', ->
  [$scope, makeController, $q, Teacher] = []

  beforeEach(module('sparta.controllers'))

  beforeEach inject ($controller, $rootScope, _$q_) ->
    $scope = $rootScope.$new()
    $q = _$q_
    Teacher =
      query: -> $q.defer().promise

    makeController = ->
      $controller 'TeachersCtrl',
        $scope: $scope
        Teacher: Teacher

  it 'exposes Teacher on the scope', ->
    queryTeacher = $q.defer()
    Teacher.query = -> queryTeacher.promise

    makeController()
    queryTeacher.resolve(teacher: {name: 'Bojangles'})
    $scope.$digest()

    expect($scope.teachers).toEqual(teacher: {name: 'Bojangles'})
