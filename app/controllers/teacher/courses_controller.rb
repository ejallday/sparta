class Teacher::CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    @course = Course.create!(course_params)
    redirect_to teacher_courses_path
  end

  def index
    @courses = Course.all
  end

  private

  def course_params
    params.require(:course).permit(:name, :period, :user_id)
  end
end
