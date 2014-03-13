#= require sparta
class StudentsCtrl
  constructor: ($scope, Student) ->
    Student.query().then (students) ->
      $scope.students = students

@controllers.controller('StudentsCtrl', ['$scope', 'Student', StudentsCtrl])
