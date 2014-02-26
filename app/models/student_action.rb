class StudentAction < ActiveRecord::Base
  belongs_to :enrollment

  validates :enrollment, presence: true
  validates :name, presence: true
end
