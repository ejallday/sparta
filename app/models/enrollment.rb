class Enrollment < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
  has_many :student_actions, dependent: :destroy, inverse_of: :enrollment
  has_many :attendances, dependent: :destroy, inverse_of: :enrollment
end
