class Guardian < ActiveRecord::Base
  belongs_to :user
  has_many :guardianships, dependent: :destroy
  has_many :students, through: :guardianships

  validates :user_id, presence: true, uniqueness: true

  delegate :first_name, :last_name, :full_name, :email, :username, :password, to: :user
end
