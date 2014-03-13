#= require sparta
uniquePropertyFilter = (objects, propertyName) ->
  _(objects)
    .pluck(propertyName)
    .unique()
    .sort()
    .value()

app.filter('uniqueProperty', [-> uniquePropertyFilter])
