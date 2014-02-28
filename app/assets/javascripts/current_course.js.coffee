#= require sparta
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

app.service('CurrentCourse', ['$window', 'Course', CurrentCourse])
