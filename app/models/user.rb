class User < ActiveRecord::Base
  has_secure_password :validations => false

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, length: { minimum: 6 }
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
end
