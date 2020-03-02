require 'rails_helper'

RSpec.describe Learning, type: :model do
  before do
    @user = User.create(
      name: "のびた",
      email: "doraemon@hoge.com",
      password: "sizukachan"
    )
  end

  it "投稿は有効であること" do
    expect(FactoryBot.build(:learning)).to be_valid
  end

  describe "学習内容は0文字以上であり、300字以内であること" do
    before do
      @learning_0    = @user.learnings.create(content: "a" * 0,
                                              learning_time: 500)
      @learning_over = @user.learnings.create(content: "a" * 301,
                                              learning_time: 500)
      @learning_less = @user.learnings.create(content: "a" * 299,
                                              learning_time: 500)
      @learning_eq   = @user.learnings.create(content: "a" * 300,
                                              learning_time: 500)
    end

    context "0文字の時" do
      it "投稿できませんと返すこと" do
        expect(@learning_0.errors[:content]).to include("を入力してください")
      end
    end

    context "300字を超える時" do
      it "投稿できませんと返すこと" do
        expect(@learning_over.errors[:content]).to include("は300文字以内で入力してください")
      end
    end

    context "1文字以上300文字以内である時" do
      it "投稿できましたと返すこと" do
        expect(@learning_less).to be_valid
        expect(@learning_eq).to be_valid
      end
    end
  end
end
