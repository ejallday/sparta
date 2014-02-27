#= require sparta
studentActionFactory = (RailsResource) ->
  class StudentAction extends RailsResource
    @configure
      url: '/courses/{{courseId}}/student_actions'
      name: 'student_action'

app.factory('StudentAction', ['RailsResource', studentActionFactory])
