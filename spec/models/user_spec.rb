require 'rails_helper'

RSpec.describe User, type: :model do
  it "有効なテストデータであること" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "名前、メールアドレス、パスワードが揃っていれば登録できること" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "名前が空では登録できないこと" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "同じメールアドレスは登録できないこと" do
    FactoryBot.create(:user, email: "hogehoge@example.com")
    user = FactoryBot.build(:user, email: "hogehoge@example.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  it "複数の投稿を持てること" do
    user = FactoryBot.create(:user, :with_microposts)
    user.valid?
    expect(user.microposts.length).to eq 5
  end
end
