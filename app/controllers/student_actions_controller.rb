class StudentActionsController < ApplicationController
  respond_to :json

  def create
    student_action = StudentAction.create!(student_action_params)
    respond_with student_action, location: nil
  end

  private

  delegate :student, :course, to: :enrollment

  def student_action_params
    params.require(:student_action).permit(:name).merge(enrollment: enrollment)
  end

  def enrollment
    course.enrollments.find_by!(student: student)
  end

  def student
    Student.find(params[:student_action][:student_id])
  end

  def course
    Course.find(params[:course_id])
  end
end
