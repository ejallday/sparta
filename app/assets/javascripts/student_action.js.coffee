#= require sparta
studentActionFactory = (RailsResource) ->
  class StudentAction extends RailsResource
    @configure
      url: '/courses/{{courseId}}/student_actions'
      name: 'student_action'

    toggleStudent: (studentId) =>
      if @studentId == studentId
        @studentId = null
      else
        @studentId = studentId

    hasStudent: (studentId) =>
      @studentId == studentId

    isValid: =>
      @name && @studentId

app.factory('StudentAction', ['RailsResource', studentActionFactory])
