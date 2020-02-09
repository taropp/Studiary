require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is valid with a name, email, and password" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "同じメールアドレスでは登録できないこと" do
    FactoryBot.create(:user, email: "test@example.com")

    user = User.new(
      name: "ホウオウ",
      email: "test@example.com",
      password: "foobar"
    )

    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end
  
  it "is invalid with a duplicate email adress" do
    FactoryBot.create(:user, email: "hogehoge@example.com")
    user = FactoryBot.build(:user, email: "hogehoge@example.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end
  
  # it "複数の投稿を持てること" do
  #   user = FactoryBot.create(:user, :with_microposts)
  #   user.valid?
  #   expect(user.microposts.length).to eq 5
  # end
end
