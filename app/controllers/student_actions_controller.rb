class StudentActionsController < ApplicationController
  helper_method :course
  respond_to :json
  respond_to :html, only: :index

  def create
    student_actions = StudentAction.create!(student_action_params)
    respond_with student_actions, location: nil
  end

  def index
    @student_actions = course.student_actions
    respond_with @student_actions
  end

  private

  delegate :student, :course, to: :enrollment

  def student_action_params
    enrollments.map do |enrollment|
      {
        name: params[:student_action][:name],
        enrollment: enrollment,
      }
    end
  end

  def enrollments
    course.enrollments.where(student_id: params[:student_action][:student_ids])
  end

  def course
    @course ||= Course.find(params[:course_id])
  end
end
