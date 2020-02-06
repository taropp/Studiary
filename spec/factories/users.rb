FactoryBot.define do
  factory :user do
    name {"ピカチュウ"}
    sequence(:email) { |n| "satoshi_kirai#{n}@example.com"}
    password {"pippikachu"}
  end
end
