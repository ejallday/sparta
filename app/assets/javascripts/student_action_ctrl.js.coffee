#= require sparta
class StudentActionCtrl
  constructor: ($scope, StudentAction, CurrentCourse) ->
    $scope.saveStudentAction = (data) =>
      studentAction = new StudentAction(data)
      studentAction.courseId = CurrentCourse.id()

      studentAction.save().then (studentAction) ->
        $scope.studentAction = {}
        $scope.alert = "#{studentAction.name} recorded for #{studentAction.studentName}"

app.controller('StudentActionCtrl', ['$scope', 'StudentAction', 'CurrentCourse', StudentActionCtrl])
