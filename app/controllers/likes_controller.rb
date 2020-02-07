class LikesController < ApplicationController
  def create
    @like = Like.new(
      user_id: current_user.id,
      post_id: params[:post_id]
    )
    @like.save
    post = Micropost.find_by(id: params[:micropost_id])
    post.create_notification_like!(current_user)
    redirect_to("/microposts/#{params[:post_id]}")
  end

  def destroy
    @like = Like.find_by(
      user_id: current_user.id,
      post_id: params[:post_id]
    )
    @like.destroy
    redirect_to("/microposts/#{params[:post_id]}")
  end
end
