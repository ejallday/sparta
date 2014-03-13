#= require sparta_services
matchInputAllowingAny = (comparable, chosen) ->
  !chosen || comparable.toString() == chosen.toString()

@services.value('matchInputAllowingAny', matchInputAllowingAny)
