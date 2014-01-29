class Course < ActiveRecord::Base
  belongs_to :teacher

  def instructor_last_name
    teacher.last_name
  end
end
