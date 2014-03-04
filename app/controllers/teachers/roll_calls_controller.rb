module Teachers
  class RollCallsController < TeachersController
    helper_method :course
    respond_to :json
    respond_to :html, only: [:edit]

    def show
      respond_with roll_call, serializer: RollCallSerializer
    end

    def edit
      respond_with roll_call
    end

    def update
      roll_call.update_statuses(params[:roll_call][:attendance_statuses])
      flash[:notice] = "#{I18n.t('.teachers.roll_calls.attendance_submitted')}"
      respond_with roll_call, location: teachers_course_path(course)
    end

    private

    def course
      Course.find(params[:course_id])
    end

    def roll_call
      @roll_call ||= RollCall.new(Date.current, course)
    end
  end
end
