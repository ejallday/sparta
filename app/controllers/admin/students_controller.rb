module Admin
  class StudentsController < AdminController
    helper_method :student
    helper_method :form

    def new
      @student = Student.new
    end

    def create
      if form.submit(new_student_params)
        flash[:info] = "#{form.first_name} #{form.last_name} added"
        redirect_to admin_student_path(form.student)
      else
        flash[:error] = form.errors.full_messages
        render :new
      end
    end

    def show
    end

    private
    def new_student_params
      params.require(:student).permit(
        user_attributes: [
          :first_name,
          :last_name,
          :username,
          :email,
          :password
        ]
      )
    end

    def form
      @form ||= AddStudentForm.build
    end

    def student
      @student ||= Student.find(params[:id])
    end
  end
end
