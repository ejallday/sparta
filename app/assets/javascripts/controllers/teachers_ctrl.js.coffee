#= require sparta
class TeachersCtrl
  constructor: ($scope, Teacher) ->
    Teacher.query().then (teachers) ->
      $scope.teachers = teachers

app.controller('TeachersCtrl', ['$scope', 'Teacher', TeachersCtrl])
