module Admin
  class StudentsController < AdminController
    helper_method :student
    def new
      @student = Student.new
    end

    def create
      @student = Student.create!(student_params)
      redirect_to admin_student_path(@student)
    end

    def show
    end

    private
    def student_params
      params.require(:student).permit(user_attributes: [:id, :student_id, :first_name, :last_name, :username, :email, :password])
    end

    def student
      @student ||= Student.find(params[:id])
    end
  end
end
