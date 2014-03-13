#= require services/match_input_allowing_any
describe 'matchInputAllowingAny', ->
  [matchInputAllowingAny] = []

  beforeEach(module('sparta.services'))

  beforeEach inject (_matchInputAllowingAny_) ->
    matchInputAllowingAny = _matchInputAllowingAny_

  it 'returns true if the selected studentId
    equals the studentAction.studentId when both are converted to strings', ->
    expect(matchInputAllowingAny(1, '1')).toBeTruthy()

  it 'returns false when no student is selected', ->
    expect(matchInputAllowingAny('', '1')).toBeFalsy()
