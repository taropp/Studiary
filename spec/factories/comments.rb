FactoryBot.define do
  factory :comment do
    content { "イーブイがライバル" }
    association :user
    association :micropost
  end
end
