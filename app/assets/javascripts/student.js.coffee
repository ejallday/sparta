#= require sparta
studentFactory = (RailsResource) ->
  class Student extends RailsResource
    @configure url: '/admin/students', name: 'student'

app.factory('Student', ['RailsResource', studentFactory])
