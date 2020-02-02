class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.page(params[:page])
  end
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end