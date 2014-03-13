#= require angularjs-rails-resource
#= require services/roll_call
describe 'RollCall', ->
  [RollCall] = []

  beforeEach(module('rails', 'sparta.services'))

  beforeEach inject (_RollCall_) ->
    RollCall = _RollCall_

  describe '#cycleAttendanceStatus', ->
    it 'changes the attendance status of the given id', ->
      rollCall = new RollCall(attendanceStatuses: { 1: 'present', 3: 'present' })

      rollCall.cycleAttendanceStatus(3)

      expect(rollCall.attendanceStatuses['1']).toEqual('present')
      expect(rollCall.attendanceStatuses['3']).not.toEqual('present')

    it 'changes the status to absent if the status is present', ->
      rollCall = new RollCall(attendanceStatuses: { 1: 'present' })

      rollCall.cycleAttendanceStatus(1)

      expect(rollCall.attendanceStatuses).toEqual(1: 'absent')

    it 'changes the status to tardy if the status is absent', ->
      rollCall = new RollCall(attendanceStatuses: { 1: 'absent' })

      rollCall.cycleAttendanceStatus(1)

      expect(rollCall.attendanceStatuses).toEqual(1: 'tardy')

    it 'changes the status to present if the status is tardy', ->
      rollCall = new RollCall(attendanceStatuses: { 1: 'tardy' })

      rollCall.cycleAttendanceStatus(1)

      expect(rollCall.attendanceStatuses).toEqual(1: 'present')
