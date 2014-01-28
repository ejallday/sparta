class Admin::AvailableTeachersController < ApplicationController
  def index
    p '*' * 50
    p params.inspect
    p '*' * 50
    @teachers = teachers_available_during_period(params[:period])
    p '*' * 50
    p @teachers
    p '*' * 50
    if request.xhr?
      render json: @teachers
    #  render layout: false
    end

   # render json: teachers
  end

  private

  def teachers_available_during_period(period)
    AvailableTeacher.for_period(period)
  end
end
