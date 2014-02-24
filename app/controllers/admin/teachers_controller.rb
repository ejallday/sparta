module Admin
  class TeachersController < AdminController
    helper_method :teachers
    respond_to :html, :json

    def new
      @teacher = Teacher.new
    end

    def index
      respond_with teachers
    end

    private

    def teachers
      @teachers ||= Teacher.includes(:user)
    end
  end
end
