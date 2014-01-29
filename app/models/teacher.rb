class Teacher < ActiveRecord::Base
  belongs_to :user
  delegate :first_name, :last_name, :email, :username, :password, to: :user
end
