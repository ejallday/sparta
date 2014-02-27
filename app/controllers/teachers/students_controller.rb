module Teachers
  class StudentsController < TeachersController
    helper_method :student
    helper_method :enrollment
    helper_method :student_action
    helper_method :classroom

    private

    def student
      @student ||= Student.find(params[:id])
    end

    def course
      @course ||= Course.find(params[:course_id])
    end

    def enrollment
      @enrollment ||= Enrollment.find_by!(student: student, course: course)
    end

    def student_action
      StudentAction.new
    end

    def classroom
      Classroom.new(teacher, course)
    end

    def teacher
      current_user.teacher
    end
  end
end

