#= require services/current_course

describe 'CurrentCourse', ->
  [CurrentCourse, $window, Course] = []

  beforeEach module 'sparta.services', ($provide) ->
    $window = location: pathname: '/courses/1'
    Course =
      get: (id) ->

    $provide.value '$window', $window
    $provide.value 'Course', Course
    null

  beforeEach inject (_CurrentCourse_) ->
    CurrentCourse = _CurrentCourse_

  describe '.id', ->
    it 'returns the url segment following "courses"', ->
      $window.location.pathname = '/courses/4'

      expect(CurrentCourse.id()).toEqual('4')

    it 'does not require "courses" to be the last segment', ->
      $window.location.pathname = '/courses/3847/foo/bar'

      expect(CurrentCourse.id()).toEqual('3847')

  describe '.get', ->
    it 'gets the course with the current id', ->
      Course.get = (id) -> "Course with id #{id}"

      expect(CurrentCourse.get()).toEqual("Course with id 1")
