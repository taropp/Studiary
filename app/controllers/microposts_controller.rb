class MicropostsController < ApplicationController
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿しました"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end
  def destroy
  end
  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end