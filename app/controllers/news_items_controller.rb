class NewsItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @news_items = NewsItem.with_user(current_user.id)
  end

  def new
    @news_item = NewsItem.new(user_id: current_user.id)
  end

  def create
    @news_item = NewsItem.new(news_item_params)
    if @news_item.save
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @news_item = NewsItem.find(params[:id])
    @news_item.news_feeds.first.update(status: true)
    @comment = @news_item.comments.new(user_id: current_user.id)
  end

  def destroy
    @news_item = NewsItem.find(params[:id])
    @news_item.destroy
    redirect_to root_url
  end

  private

  def news_item_params
    params[:news_item][:user_id] = current_user.id
    params.require(:news_item).permit(:body, :user_id)
  end

end