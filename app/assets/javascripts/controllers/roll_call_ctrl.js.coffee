#= require ../sparta_controllers
class RollCallCtrl
  constructor: ($scope, CurrentCourse, RollCall, $window) ->
    RollCall.get(courseId: CurrentCourse.id()).then (rollCall) ->
      $scope.rollCall = rollCall

    $scope.saveRollCall = (rollCall) ->
      rollCall.update().then (rollCall) ->
        $window.location = "/teachers/courses/#{rollCall.courseId}"

@controllers.controller('RollCallCtrl', ['$scope', 'CurrentCourse', 'RollCall', '$window', RollCallCtrl])
