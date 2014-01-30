class User < ActiveRecord::Base
  include Clearance::User
  has_one :teacher
  has_one :student

  def full_name
    "#{first_name} #{last_name}"
  end

  def teacher?
    teacher.present?
  end

  def student?
    student.present?
  end
end
