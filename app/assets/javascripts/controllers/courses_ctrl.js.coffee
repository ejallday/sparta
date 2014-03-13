#= require ../sparta_controllers
class CoursesCtrl
  constructor: ($scope, Course) ->
    Course.query().then (courses) ->
      $scope.courses = courses

    $scope.semiStrict = (actual, expected) ->
      !expected? || expected == actual

@controllers.controller('CoursesCtrl', ['$scope', 'Course', CoursesCtrl])
