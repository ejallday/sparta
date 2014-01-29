class Teachers::CoursesController < ApplicationController
  helper_method :courses

  def index
  end

  private

  def courses
    @courses ||= teacher.courses.order(:period)
  end

  def teacher
    current_user.teacher
  end
end
