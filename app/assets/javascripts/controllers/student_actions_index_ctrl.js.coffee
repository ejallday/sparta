#= require sparta
class StudentActionsIndexCtrl
  constructor: ($scope, StudentAction, CurrentCourse) ->
    StudentAction.query({}, courseId: CurrentCourse.id()).then (studentActions) ->
      $scope.studentActions = studentActions

    $scope.allowStrings = (expected, actual) ->
      !actual || expected.toString() == actual.toString()

    CurrentCourse.get().then (course) ->
      $scope.course = course

app.controller('StudentActionsIndexCtrl', ['$scope', 'StudentAction', 'CurrentCourse', StudentActionsIndexCtrl])
