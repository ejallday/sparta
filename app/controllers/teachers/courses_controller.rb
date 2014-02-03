class Teachers::CoursesController < ApplicationController
  helper_method :course
  helper_method :courses

  def index
  end

  def show
  end

  private

  def course
    @course ||= Course.includes(:students).find(params[:id])
  end

  def courses
    @courses ||= teacher.courses.order(:period)
  end

  def teacher
    current_user.teacher
  end
end
