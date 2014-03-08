#= require sparta
guardianFactory = (RailsResource) ->
  class Guardian extends RailsResource
    @configure url: '/admin/guardians', name: 'guardian'

app.factory('Guardian', ['RailsResource', guardianFactory])
