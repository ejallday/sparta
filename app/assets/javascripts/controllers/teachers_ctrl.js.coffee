#= require sparta
class TeachersCtrl
  constructor: ($scope, Teacher) ->
    Teacher.query().then (teachers) ->
      $scope.teachers = teachers

@controllers.controller('TeachersCtrl', ['$scope', 'Teacher', TeachersCtrl])
