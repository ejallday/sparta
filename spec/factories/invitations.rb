FactoryGirl.define do
  factory :invitation do
    guardian_email 'therealmrt@example.com'
    student
  end
end
