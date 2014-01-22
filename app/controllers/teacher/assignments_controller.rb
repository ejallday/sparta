class Teacher::AssignmentsController < ApplicationController

  def create
    Assignment.create(assignment_params)
    redirect_to teacher_assignments_path
  end

  def index
    @assignments = Assignment.all
  end

  def new
    @assignment = Assignment.new
  end

  private
  def assignment_params
    params.require(:assignment).permit(:course_id, :name, :description, :date_assigned, :date_due, :points_possible)
  end
end
