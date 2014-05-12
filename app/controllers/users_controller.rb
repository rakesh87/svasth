class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @unread_news = current_user.unread_news_count
    @read_news   = current_user.read_news_count
  end

  def feeds_count
    render json: {
      unread_news_count: current_user.unread_news_count,
      read_news_count: current_user.read_news_count
    }
  end
end
