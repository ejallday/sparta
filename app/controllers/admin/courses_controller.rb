module Admin
  class CoursesController < AdminController
    helper_method :course
    helper_method :courses
    respond_to :html

    def create
      @course = Course.create!(course_params)
      redirect_to admin_courses_path
    end

    def edit
    end

    def destroy
      course.destroy
      redirect_to admin_courses_path, notice: t('courses.deleted')
    end

    def new
      @course = Course.new
    end

    def update
      course.update_attributes(course_params)
      redirect_to admin_courses_path
    end

    private

    def course_params
      params.require(:course).permit(:name, :period, :teacher_id)
    end

    def course
      @course ||= Course.find(params[:id])
    end
  end
end
