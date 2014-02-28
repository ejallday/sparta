#= require sparta
courseFactory = (RailsResource) ->
  class Course extends RailsResource
    @configure url: '/courses', name: 'course'

app.factory('Course', ['RailsResource', courseFactory])
