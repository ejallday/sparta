class StudentActionsController < ApplicationController
  def create
    student_action = StudentAction.create!(student_action_params)
    flash[:notice] = t('.flash', behavior: student_action.name, student: student.full_name)
    redirect_to teachers_course_path(course)
  end

  private

  delegate :student, :course, to: :enrollment

  def student_action_params
    params.require(:student_action).permit(:name).merge(enrollment: enrollment)
  end

  def enrollment
    Enrollment.find(params[:enrollment_id])
  end
end
