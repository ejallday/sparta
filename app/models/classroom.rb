class Classroom
  attr_reader :teacher, :course
  delegate :students, to: :course

  def initialize(teacher, course)
    @teacher = teacher
    @course = course
  end
end
