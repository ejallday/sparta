#= require sparta
teacherFactory = (RailsResource) ->
  class Teacher extends RailsResource
    @configure url: '/admin/teachers', name: 'teacher'

app.factory('Teacher', ['RailsResource', teacherFactory])
