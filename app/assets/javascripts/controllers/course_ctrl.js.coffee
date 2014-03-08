#= require sparta
class CourseCtrl
  constructor: ($scope, CurrentCourse) ->
    CurrentCourse.get().then (course) ->
      $scope.course = course

app.controller('CourseCtrl', ['$scope', 'CurrentCourse', CourseCtrl])
