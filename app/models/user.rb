class User < ActiveRecord::Base
  include Clearance::User
  has_many :courses

  def full_name
    "#{first_name} #{last_name}"
  end
end
