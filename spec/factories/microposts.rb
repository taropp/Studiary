FactoryBot.define do
  factory :micropost do
    sequence(:content) { |n| "MyText#{n}" }
    association :owner

    trait :with_comments do
      after(:create) { |micropost| create_list(:comment, 5, micropost: micropost) }
    end
  
    trait :invalid do
      content {nil}
    end
  end
end
