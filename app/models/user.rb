class User < ActiveRecord::Base
  include Clearance::User
  has_one :teacher
  has_one :student
  has_one :guardian

  def full_name
    "#{first_name} #{last_name}"
  end

  def teacher?
    teacher.present?
  end

  def student?
    student.present?
  end

  def guardian?
    guardian.present?
  end
end
