class StudentAction < ActiveRecord::Base
  belongs_to :enrollment
  has_one :student, through: :enrollment

  validates :enrollment, presence: true
  validates :name, presence: true

  def student_name
    student.full_name
  end
end
