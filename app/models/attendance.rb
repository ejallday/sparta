class Attendance < ActiveRecord::Base
  belongs_to :enrollment
  after_initialize :set_default_values

  delegate :initials, to: :student, prefix: true
  delegate :student, to: :enrollment

  private

  def set_default_values
    self.date ||= Date.current
  end
end
