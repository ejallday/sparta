class Guardian < ActiveRecord::Base
  belongs_to :user
  delegate :first_name, :last_name, :full_name, :email, :username, :password, to: :user
end
