class PagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build
    @feed_items = current_user.feed.page(params[:page]).per(12)
  end
end
