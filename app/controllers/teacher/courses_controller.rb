class Teacher::CoursesController < ApplicationController

  def create
    @course = Course.create!(course_params)
    redirect_to teacher_courses_path
  end

  def edit
    course
  end

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def update
    course.update_attributes(course_params)
    redirect_to teacher_courses_path
  end

  private

  def course_params
    params.require(:course).permit(:name, :period, :user_id)
  end

  def course
    @course = Course.find_by(id: params[:id])
  end
end
