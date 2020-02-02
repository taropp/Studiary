class PagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build
  end
  def index
  end
  def show
  end
end