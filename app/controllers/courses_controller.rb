class CoursesController < ApplicationController
  helper_method :course
  respond_to :json

  def index
    respond_with courses
  end

  def show
    respond_with course
  end

  private

  def courses
    @courses ||= Course.includes(students: :user, teacher: :user)
  end

  def course
    @course ||= courses.find(params[:id])
  end
end
