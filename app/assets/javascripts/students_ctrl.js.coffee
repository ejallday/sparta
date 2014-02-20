#= require sparta
class StudentsCtrl
  constructor: ($scope, Student) ->
    Student.query().then (students) ->
      $scope.students = students

app.controller('StudentsCtrl', ['$scope', 'Student', StudentsCtrl])
