class Assignment < ActiveRecord::Base
  belongs_to :course

  validates :name, :assigned_on, :due_on, :points_possible, presence: true
end
