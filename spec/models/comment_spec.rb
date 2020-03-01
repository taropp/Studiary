require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = User.create(
      name: "ルギア",
      email: "test@example.com",
      password: "hogehoge"
    )
  end

  describe "投稿できる文字数を1字以上10字以内にする" do
    before do
      @comment_emp = @user.comments.create(content: nil)
      @comment_over = @user.comments.create(content: "a" * 11)
      @comment_under = @user.comments.create(content: "a" * 9)
      @comment_eq = @user.comments.create(content: "a" * 10)
    end

    context "0字の時" do
      it "投稿できませんと返すこと" do
        expect(@comment_emp.errors[:content]).to include("を入力してください")
      end
    end

    context "11字の時" do
      it "投稿できませんと返すこと" do
        expect(@comment_over.errors[:content]).to include("は10文字以内で入力してください")
      end
    end

    xcontext "10字以内の時" do
      it "投稿できましたと返すこと" do
        expect(@comment_under).to be_valid
        expect(@comment_eq).to be_valid
      end
    end
  end
end
