class Course < ActiveRecord::Base
  belongs_to :teacher, class_name: 'User', foreign_key: 'user_id'

  def instructor_last_name
    teacher.last_name
  end
end
