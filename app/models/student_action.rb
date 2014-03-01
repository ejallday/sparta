class StudentAction < ActiveRecord::Base
  POSITIVE_BEHAVIORS = ['Quality Work', 'Participation']
  NEGATIVE_BEHAVIORS = ['Swearing', 'Calling out']

  belongs_to :enrollment
  has_one :student, through: :enrollment

  validates :enrollment, presence: true
  validates :name, inclusion: { in: POSITIVE_BEHAVIORS + NEGATIVE_BEHAVIORS }

  delegate :id, to: :student, prefix: true

  def student_name
    student.full_name
  end
end
