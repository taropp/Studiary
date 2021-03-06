require 'rails_helper'

RSpec.describe Micropost, type: :model do
  before do
    @user = User.create(
      name: "ルギア",
      email: "test@example.com",
      password: "hogehoge"
    )
  end

  xit "ユーザー単位では重複した内容の投稿はできないこと" do
    @user.microposts.create(
      content: "hagehage"
    )

    new_micropost = @user.microposts.build(
      content: "hagehage"
    )

    new_micropost.valid?
    expect(new_micropost.errors[:content]).to include("はすでに存在します")
  end

  xit "二人のユーザーが同じ投稿をすることは許可すること" do
    @user.microposts.create(
      content: "hagehage"
    )

    other_user = User.create(
      name: "ホウオウ",
      email: "tests@example.com",
      password: "hogehoge"
    )

    other_micropost = other_user.microposts.build(
      content: "hagehage"
    )

    expect(other_micropost).to be_valid
  end

  describe "投稿できる文字数を1字以上10字以内に制限する" do
    before do
      @micropost0 = @user.microposts.create(content: nil)
      @micropost1 = @user.microposts.create(content: "a" * 11)
      @micropost2 = @user.microposts.create(content: "a" * 9)
      @micropost3 = @user.microposts.create(content: "a" * 10)
    end

    context "0字の時" do
      it "投稿できませんと返すこと" do
        expect(@micropost0.errors[:content]).to include("を入力してください")
      end
    end

    context "10字を超える時" do
      it "投稿できませんと返すこと" do
        expect(@micropost1.errors[:content]).to include("は10文字以内で入力してください")
      end
    end

    context "10字を超えない時" do
      it "投稿しましたと返すこと" do
        expect(@micropost2).to be_valid
        expect(@micropost3).to be_valid
      end
    end
  end

  it "複数のコメントを持てること" do
    micropost = FactoryBot.create(:micropost, :with_comments)
    expect(micropost.comments.length).to eq 5
  end
end
