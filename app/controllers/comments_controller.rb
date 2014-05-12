class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    news_item = get_news_item
    render json: news_item.comments_with_user
  end

  def create
    news_item = get_news_item
    comment   = news_item.comments.new(comments_param)
    if comment.save
      render json: {user_email: current_user.email, comment_body: comment.body}
    else
      render json: {error_message: comment.errors.full_messages}, status: :internal_server_error
    end
  end

  private

  def comments_param
    params.require(:comment).permit(:body, :user_id)
  end

  def get_news_item
    NewsItem.find(params[:news_item_id])
  end
end
