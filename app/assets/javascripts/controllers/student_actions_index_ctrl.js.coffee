#= require sparta
class StudentActionsIndexCtrl
  constructor: ($scope, StudentAction, CurrentCourse, matchInputAllowingAny) ->
    StudentAction.query({}, courseId: CurrentCourse.id()).then (studentActions) ->
      $scope.studentActions = studentActions

      $scope.matchInputAllowingAny = matchInputAllowingAny

    CurrentCourse.get().then (course) ->
      $scope.course = course

@controllers.controller('StudentActionsIndexCtrl', ['$scope', 'StudentAction', 'CurrentCourse', 'matchInputAllowingAny', StudentActionsIndexCtrl])
