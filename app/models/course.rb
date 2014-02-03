class Course < ActiveRecord::Base
  belongs_to :teacher

  def instructor_first_name
    teacher.first_name
  end

  def instructor_full_name
    teacher.full_name
  end

  def instructor_last_name
    teacher.last_name
  end
end
