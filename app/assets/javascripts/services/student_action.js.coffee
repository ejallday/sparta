#= require sparta_services
studentActionFactory = (RailsResource) ->
  class StudentAction extends RailsResource
    @configure
      url: '/courses/{{courseId}}/student_actions'
      name: 'student_action'

    constructor: ->
      super(arguments...)
      @studentIds ?= []

    toggleStudent: (studentId) =>
      if @hasStudent(studentId)
        _.remove(@studentIds, (id) -> id == studentId)
      else
        @studentIds.push(studentId)

    hasStudent: (studentId) =>
      _.include(@studentIds, studentId)

    isValid: =>
      !_.isEmpty(@studentIds)

services.factory('StudentAction', ['RailsResource', studentActionFactory])
