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
    params.require(:assignment).permit(:course_id, :name, :description, :assigned_on, :due_on, :points_possible)
  end
end
