class Guardianship < ActiveRecord::Base
  belongs_to :guardian
  belongs_to :student

  validates :guardian_id, presence: true
  validates :student_id, presence: true
end
