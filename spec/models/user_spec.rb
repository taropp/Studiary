require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is valid with a name, email, and password" do
    user = User.new(
      name: "ルギア",
      email: "test@example.com",
      password: "hogehoge"
    )
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
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
end
