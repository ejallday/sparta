class Invitation < ActiveRecord::Base
  belongs_to :student

  validates :student, presence: true
  validates :guardian_email, presence: true

  before_create :generate_token

  def student_name
    student.full_name
  end

  def to_param
    token
  end

  private

  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.new, rand].join)
  end
end
