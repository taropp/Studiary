FactoryBot.define do
  factory :user, aliases: [:owner] do
    name { "ピカチュウ" }
    sequence(:email) { |n| "satoshi_kirai#{n}@example.com" }
    password { "pippikachu" }
  end
  
  # trait :with_microposts do
  #   after(:create) { |user| create_list(:micropost, 5, user: user) }
  # end
end
