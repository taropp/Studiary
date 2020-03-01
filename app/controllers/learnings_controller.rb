class LearningsController < ApplicationController
  def index
    @learnings = Learning.all
  end

  def new
    @learning = Learning.new
  end

  def show
    @learning = Learning.find(params[:id])
  end

  def create
    @learning = current_user.learnings.build(learning_params)
    if @learning.save
      flash[:success] = "投稿しました"
      redirect_to root_path
    else
      @feed_items = []
      render template: "pages/home"
    end
  end

  def destroy
  end

  private

  def learning_params
    params.require(:learning).permit(:learning_time, :subject, :content)
  end
end
