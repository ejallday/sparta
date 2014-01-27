class Teacher::CoursesController < ApplicationController
  helper_method :courses

  def index
  end

  private

  def courses
    @courses ||= current_user.courses
  end
end
