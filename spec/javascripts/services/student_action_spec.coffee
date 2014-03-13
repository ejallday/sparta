#= require angularjs-rails-resource
#= require services/student_action
describe 'StudentAction', ->
  [StudentAction] = []

  beforeEach(module('rails', 'sparta.services'))

  beforeEach inject (_StudentAction_) ->
    StudentAction = _StudentAction_

  describe '#hasStudent', ->
    it 'returns true if the studentId is present in @studentIds', ->
      studentAction = new StudentAction()
      studentAction.studentIds = [1]

      expect(studentAction.hasStudent(1)).toBeTruthy()

    it 'returns false if the studentId is not present in @studentIds', ->
      studentAction = new StudentAction()
      studentAction.studentIds = [1]

      expect(studentAction.hasStudent(2)).toBeFalsy()

  describe '#isValid', ->
    it 'returns true if @studentIds is not empty', ->
      studentAction = new StudentAction()
      studentAction.studentIds = [1]

      expect(studentAction.isValid()).toBeTruthy()

    it 'returns false if @studentIds is empty', ->
      studentAction = new StudentAction()
      studentAction.studentIds = []

      expect(studentAction.isValid()).toBeFalsy()

  describe '#toggleStudent', ->
    it 'adds a studentId to the @studentIds array if it is not present', ->
      studentAction = new StudentAction()
      studentAction.studentIds = []
      studentAction.toggleStudent(1)

      expect(studentAction.studentIds).toContain(1)

    it 'removes a studentId from @studentIds array if it is present', ->
      studentAction = new StudentAction()
      studentAction.studentIds = [1]
      studentAction.toggleStudent(1)

      expect(studentAction.studentIds).not.toContain(1)
