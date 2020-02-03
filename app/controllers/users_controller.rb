class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.page(params[:page])
  end
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page])
    render 'show_follow'
  end
  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page])
    render 'show_follow'
  end
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end