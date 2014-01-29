class User < ActiveRecord::Base
  include Clearance::User
  has_one :teacher

  def full_name
    "#{first_name} #{last_name}"
  end

  def teacher?
    teacher.present?
  end
end
