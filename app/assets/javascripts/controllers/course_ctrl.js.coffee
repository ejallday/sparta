#= require ../sparta_controllers
class CourseCtrl
  constructor: ($scope, CurrentCourse) ->
    CurrentCourse.get().then (course) ->
      $scope.course = course

@controllers.controller('CourseCtrl', ['$scope', 'CurrentCourse', CourseCtrl])
