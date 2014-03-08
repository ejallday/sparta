#= require sparta
class StudentActionCtrl
  constructor: ($scope, StudentAction, CurrentCourse) ->
    resetStudentAction = ->
      $scope.studentAction = new StudentAction()

    resetStudentAction()

    $scope.saveStudentAction = (studentAction, name) =>
      studentAction.courseId = CurrentCourse.id()
      studentAction.name = name

      studentAction.save().then ->
        resetStudentAction()
        $scope.alert = "#{studentAction.name} recorded"

app.controller('StudentActionCtrl', ['$scope', 'StudentAction', 'CurrentCourse', StudentActionCtrl])
