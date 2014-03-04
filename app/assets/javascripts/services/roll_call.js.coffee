#= require sparta_services
rollCallFactory = (RailsResource) ->
  class RollCall extends RailsResource
    @configure url: '/teachers/courses/{{courseId}}/roll_call', name: 'roll_call'

    cycleAttendanceStatus: (attendanceId) =>
      status = @attendanceStatuses[attendanceId]
      @attendanceStatuses[attendanceId] = switch status
        when 'present' then 'absent'
        when 'absent' then 'tardy'
        else 'present'

services.factory('RollCall', ['RailsResource', rollCallFactory])
