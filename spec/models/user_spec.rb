require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email, and password" do
    user = User.new(
      name: "ルギア",
      email: "test@example.com",
      password: "hogehoge"
    )
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "is invalid without an email address" do
    User.create(
      name: "ルギア",
      email: "test@example.com",
      password: "hogehoge"
    )

    user = User.new(
      name: "ルギア",
      email: "test@example.com",
      password: "hogehoge"
    )

    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  it "is invalid with a duplicate email address"

  it "returns a user's full name as a string"
end
