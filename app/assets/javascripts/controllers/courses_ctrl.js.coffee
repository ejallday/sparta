#= require sparta
class CoursesCtrl
  constructor: ($scope, Course) ->
    Course.query().then (courses) ->
      $scope.courses = courses

    $scope.semiStrict = (actual, expected) ->
      !expected? || expected == actual

app.controller('CoursesCtrl', ['$scope', 'Course', CoursesCtrl])
