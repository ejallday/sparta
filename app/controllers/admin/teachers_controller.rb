module Admin
  class TeachersController < AdminController
    helper_method :teacher
    helper_method :teachers
    helper_method :form
    respond_to :html, :json

    def new
      @teacher = Teacher.new
    end

    def create
      if form.submit(new_teacher_params)
        flash[:info] = "#{form.first_name} #{form.last_name} added"
        redirect_to admin_teacher_path(form.teacher)
      else
        flash[:error] = form.errors.full_messages
        render :new
      end
    end

    def show
    end

    def index
      respond_with teachers
    end

    private

    def new_teacher_params
      params.require(:teacher).permit(
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
      @form ||= AddTeacherForm.build
    end

    def teacher
      @teacher ||= Teacher.find(params[:id])
    end

    def teachers
      @teachers ||= Teacher.includes(:user)
    end
  end
end
