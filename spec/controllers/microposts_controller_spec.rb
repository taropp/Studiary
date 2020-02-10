require 'rails_helper'

RSpec.describe MicropostsController, type: :controller do
  describe "#index" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
      end
      
      it "responds succsessfully" do
        sign_in @user
        get :index
        expect(response).to be_successful
      end
      
      it "returns a 200 response" do
        sign_in @user
        get :index
        expect(response).to have_http_status "200"
      end
    end
    
    context "as a guest" do
      it "returns a 302 response" do
        get :index
        expect(response).to have_http_status "302"
      end
      
      it "redirects to the sign-in page" do
        get :index
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
  
  describe "#show" do
    context "投稿した本人である時" do
      before do
        @user = FactoryBot.create(:user)
        @micropost = FactoryBot.create(:micropost, owner: @user)
      end
      
      it "閲覧ができること" do
        sign_in @user
        get :show, params: { id: @micropost.id }
        expect(response).to be_successful
      end
    end
    
    context "投稿した本人でない時" do
      before do
        @user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:user)
        @micropost = FactoryBot.create(:micropost, owner: other_user)
      end
      
      it "閲覧ができること" do
        sign_in @user
        get :show, params: { id: @micropost.id }
        expect(response).to be_successful
      end
    end
  end
  
  describe "#create" do
    context "認証済みユーザーとして" do
      before do
        @user = FactoryBot.create(:user)
      end
      
      context "有効な属性値の場合" do
        it "投稿ができること" do
          micropost_params = FactoryBot.attributes_for(:micropost)
          sign_in @user
          expect {
            post :create, params: { micropost: micropost_params }
          }.to change(@user.microposts, :count).by(1)
        end
      end
      
      context "無効な属性値の場合" do
        it "投稿ができないこと" do
          micropost_params = FactoryBot.attributes_for(:micropost, :invalid)
          sign_in @user
          expect {
            post :create, params: { micropost: micropost_params }
          }.to change(@user.microposts, :count).by(0)
        end
      end
    end
    
    context "ゲストとして" do
      it "302レスを返すこと" do
        micropost_params = FactoryBot.attributes_for(:micropost)
        post :create, params: { micropsot: micropost_params }
        expect(response).to have_http_status "302"
      end
      
      it "ログイン画面に戻ること" do
        micropost_params = FactoryBot.attributes_for(:micropost)
        post :create, params: { micropost: micropost_params }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
  
  describe "#destroy" do
    context "認可されたユーザーとして" do
      before do
        @user = FactoryBot.create(:user)
        @micropost = FactoryBot.create(:micropost, owner: @user)
      end
      
      it "投稿を削除できること" do
        sign_in @user
        expect{
          delete :destroy, params: { id: @micropost.id }
        }.to change(@user.microposts, :count).by(-1)
      end
    end
    context "認可されていないユーザーとして" do
      before do
        @user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:user)
        @micropost = FactoryBot.create(:micropost, owner: other_user)
      end
      
      it "投稿を削除できないこと" do
        sign_in @user
        expect{
          delete :destroy, params: { id: @micropost.id }
        }.to_not change(Micropost, :count)#change(@user.microposts, :count).by(0)
      end
    end
  end
end