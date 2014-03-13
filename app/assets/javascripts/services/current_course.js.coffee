#= require ../sparta_services
class CurrentCourse
  constructor: ($window, @Course) ->
    @$location =
      url: => $window.location.pathname

  id: =>
    parts = @$location.url().split('/')
    courseIndex = parts.indexOf('courses')
    parts[courseIndex + 1]

  get: =>
    @Course.get(@id())

services.service('CurrentCourse', ['$window', 'Course', CurrentCourse])
