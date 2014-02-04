module Admin
  class AvailableTeachersController < AdminController
    def index
      @teachers = teachers_available_during_period(params[:period])
      render json: @teachers.to_json(methods: :full_name) if request.xhr?
    end

    private

    def teachers_available_during_period(period)
      AvailableTeacher.for_period(period)
    end
  end
end
