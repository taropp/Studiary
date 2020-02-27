require 'rails_helper'

RSpec.describe LearningsController, type: :controller do
  describe "#index" do
    context "ログイン済みユーザーとして" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "正しいリクエストが返ってくること" do
        sign_in @user
        get :index
        expect(response).to be_successful
      end

      it "200レスが返ってくること" do
        sign_in @user
        get :index
        expect(response).to have_http_status "200"
      end
    end

    context "認証済みでないユーザーとして" do
      it "302レスが返ってくること" do
        get :index
        expect(response).to have_http_status "302"
      end

      it "ログイン画面に戻ってくること" do
        get :index
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
end
