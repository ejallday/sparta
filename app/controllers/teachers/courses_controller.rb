module Teachers
  class CoursesController < TeachersController
    helper_method :classroom
    helper_method :course
    helper_method :courses
    helper_method :teacher

    def index
    end

    def show
    end

    private

    def classroom
      Classroom.new(teacher, course)
    end

    def course
      @course ||= Course.includes(students: :user).find(params[:id])
    end

    def courses
      @courses ||= teacher.courses.order(:period)
    end

    def teacher
      current_user.teacher
    end
  end
end
