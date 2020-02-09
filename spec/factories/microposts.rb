FactoryBot.define do
  factory :micropost do
    sequence(:content) { |n| "MyText#{n}" }
    association :owner
  end
  
  trait :with_comments do
    after(:create) { |micropost| create_list(:comment, 5, micropost: micropost) }
  end
end
