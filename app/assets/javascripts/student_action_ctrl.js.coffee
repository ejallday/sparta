#= require sparta
class StudentActionCtrl
  constructor: ($scope, StudentAction, CurrentCourse) ->
    resetStudentAction = ->
      $scope.studentAction = new StudentAction()

    resetStudentAction()

    $scope.saveStudentAction = (studentAction) =>
      studentAction.courseId = CurrentCourse.id()

      studentAction.save().then (studentAction) ->
        resetStudentAction()
        $scope.alert = "#{studentAction.name} recorded for #{studentAction.studentName}"

app.controller('StudentActionCtrl', ['$scope', 'StudentAction', 'CurrentCourse', StudentActionCtrl])
