User.create!(name:  "マグマラシ",
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
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

5.times do |n|
  Like.create!(
    post_id: 295,
    user_id: n + 1
    )
end
