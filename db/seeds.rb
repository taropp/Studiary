User.create!(name:  "マグマラシ",
             email: "example@hoge.com",
             password:              "foobar",
             password_confirmation: "foobar")
20.times do |n|
  name  = Faker::Games::Pokemon.name
  email = "example-#{n+1}@hoge.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.all
user  = users.first
following = users[2..20]
followers = users[3..15]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
