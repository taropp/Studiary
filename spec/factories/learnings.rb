FactoryBot.define do
  factory :learning do
    content { "hogehoge" }
    learning_time { 600 }
    user_id { 1 }
  end
end
