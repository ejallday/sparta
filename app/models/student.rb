class Student < ActiveRecord::Base
  belongs_to :user
  has_many :guardianships, dependent: :destroy
  has_many :guardians, through: :guardianships
  has_many :enrollments
  has_many :student_actions, through: :enrollments

  delegate :first_name, :last_name, :full_name, :email, :username, :password, to: :user

  accepts_nested_attributes_for :user

  def initials
    "#{first_name[0].upcase}#{last_name[0].downcase}"
  end

  def user
    super || build_user
  end
end
