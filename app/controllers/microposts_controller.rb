class MicropostsController < ApplicationController
  before_action :correct_user, only: :destroy
  def index
    @microposts = Micropost.all
  end

  def new
    @micropost = Micropost.new
  end

  def show
    @micropost = Micropost.find_by(id: params[:id])
    @user = @micropost.user
    @likes_count = Like.where(post_id: @micropost.id).count
    @comments = @micropost.comments.includes(:user)
    @comment = @micropost.comments.build(user_id: current_user.id)
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿しました"
      redirect_to root_path
    else
      @feed_items = []
      render template: 'pages/home'
    end
  end

  def destroy
    if signed_in?
      @micropost.destroy
      flash[:notice] = "削除しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "削除できません"
      redirect_to micropost_path
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_path if @micropost.nil?
  end
end
