class Teachers::CoursesController < ApplicationController
  helper_method :courses

  def index
  end

  private

  def courses
    @courses ||= current_user.courses.order(:period)
  end
end
