User.create!(name:  "Potepan",
             email: "example@hoge.com",
             password:              "foobar",
             password_confirmation: "foobar")
50.times do |n|
  name  = Faker::Games::Pokemon.name
  email = "example-#{n+1}@hoge.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end