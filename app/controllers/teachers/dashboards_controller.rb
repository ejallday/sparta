module Teachers
  class DashboardsController < TeachersController
    helper_method :teacher
    helper_method :courses

    def show
    end

    private

    def teacher
      @teacher ||= Teacher.includes(:courses).find_by(user_id: current_user.id)
    end

    def courses
      @courses ||= teacher.courses
    end
  end
end
