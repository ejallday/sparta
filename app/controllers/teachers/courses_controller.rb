class Teachers::CoursesController < ApplicationController
  before_filter :authorize_teacher
  helper_method :classroom
  helper_method :courses

  def index
  end

  def show
  end

  private

  def classroom
    Classroom.new(teacher, course)
  end

  def course
    @course ||= Course.includes(:students).find(params[:id])
  end

  def courses
    @courses ||= teacher.courses.order(:period)
  end

  def teacher
    current_user.teacher
  end

  def authorize_teacher
    unless current_user && current_user.teacher?
      flash[:error] = I18n.t('errors.teacher.unauthorized')
      redirect_to sign_in_path
    end
  end
end
