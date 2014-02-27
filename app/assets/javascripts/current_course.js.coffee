#= require sparta
class CurrentCourse
  constructor: ($window) ->
    @$location =
      url: => $window.location.pathname

  id: =>
    parts = @$location.url().split('/')
    courseIndex = parts.indexOf('courses')
    parts[courseIndex + 1]

app.service('CurrentCourse', ['$window', CurrentCourse])
