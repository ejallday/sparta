class Admin::CoursesController < ApplicationController
  helper_method :course
  before_filter :authorize_admin

  def create
    @course = Course.create!(course_params)
    redirect_to admin_courses_path
  end

  def edit
  end

  def destroy
    course.destroy
    redirect_to admin_courses_path, notice: t('courses.deleted')
  end

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def update
    course.update_attributes(course_params)
    redirect_to admin_courses_path
  end

  private

  def course_params
    params.require(:course).permit(:name, :period, :teacher_id)
  end

  def course
    @course ||= Course.find(params[:id])
  end

  def authorize_admin
    unless current_user && current_user.admin?
      flash[:error] = I18n.t('errors.unauthorized')
      redirect_to sign_in_path
    end
  end
end
