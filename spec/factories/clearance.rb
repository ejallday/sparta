FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    first_name 'Jane'
    last_name 'Doe'
    username 'janedoe1'
    email
    password 'password'
  end
end
