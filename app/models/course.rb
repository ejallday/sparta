class Course < ActiveRecord::Base
  belongs_to :teacher
  has_many :enrollments
  has_many :students, through: :enrollments

  def instructor_last_name
    teacher.last_name
  end
end
