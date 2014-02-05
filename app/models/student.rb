class Student < ActiveRecord::Base
  belongs_to :user
  has_many :enrollments

  delegate :first_name, :last_name, :full_name, :email, :username, :password, to: :user

  accepts_nested_attributes_for :user

  def initials
    "#{first_name[0]}#{last_name[0]}"
  end

  def user
    super || build_user
  end
end
