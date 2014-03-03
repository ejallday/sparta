#= require sparta
class StudentActionCtrl
  constructor: ($scope, StudentAction, CurrentCourse) ->
    resetStudentAction = ->
      $scope.studentAction = new StudentAction()

    resetStudentAction()

    CurrentCourse.get().then (course) ->
      $scope.course = course

    $scope.saveStudentAction = (studentAction) =>
      studentAction.courseId = CurrentCourse.id()

      studentAction.save().then ->
        resetStudentAction()
        $scope.alert = "#{studentAction.name} recorded"

app.controller('StudentActionCtrl', ['$scope', 'StudentAction', 'CurrentCourse', StudentActionCtrl])
