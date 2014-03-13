#= require controllers/students_ctrl
describe 'StudentsCtrl', ->
  [$scope, makeController, $q, Student] = []

  beforeEach(module('sparta.controllers'))

  beforeEach inject ($controller, $rootScope, _$q_) ->
    $scope = $rootScope.$new()
    $q = _$q_
    Student =
      query: -> $q.defer().promise

    makeController = ->
      $controller 'StudentsCtrl',
        $scope: $scope
        Student: Student

  it 'exposes Student on the scope', ->
    queryStudent = $q.defer()
    Student.query = -> queryStudent.promise

    makeController()
    queryStudent.resolve(student: {name: 'Bojangles'})
    $scope.$digest()

    expect($scope.students).toEqual(student: {name: 'Bojangles'})
