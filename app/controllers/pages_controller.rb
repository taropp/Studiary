class PagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build
    @feed_items = current_user.feed.page(params[:page])
  end
  def index
  end
  def show
  end
end