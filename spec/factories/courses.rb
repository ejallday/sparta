FactoryGirl.define do
  factory :course do
    name "History"
    period '1'
    association :teacher, factory: :user
  end
end
