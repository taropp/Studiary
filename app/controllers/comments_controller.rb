class CommentsController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = current_user.comments.build(micropost_id: @micropost.id,
                                           content: params[:comment][:content])
    @comments = @micropost.comments
    if @comment.save
      @micropost.create_notification_comment!(current_user, @comment.id)
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "コメントを入力してください"
      redirect_back(fallback_location: root_path)
    end
  end
end
