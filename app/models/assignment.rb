class Assignment < ActiveRecord::Base
  belongs_to :course

  validates :name, :date_assigned, :date_due, :points_possible, presence: true
end
