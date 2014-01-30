FactoryGirl.define do
  factory :guardian do
    ignore do
      first_name Faker::Name.first_name
      last_name Faker::Name.last_name
    end
    association :user

    after(:build) do |guardian, evaluator|
      user = guardian.user
      if evaluator.first_name.present?
        user.first_name = evaluator.first_name
      end

      if evaluator.last_name.present?
        user.last_name = evaluator.last_name
      end

      if user.changed.any?
        user.save!
      end
    end
  end
end
