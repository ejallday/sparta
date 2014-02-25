class Teacher < ActiveRecord::Base
  belongs_to :user
  has_many :courses
  delegate :first_name, :last_name, :full_name, :email, :username, :password, to: :user

  accepts_nested_attributes_for :user

  def user
    super || build_user
  end
end
