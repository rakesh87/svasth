class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :news_items, through: :news_feeds
  has_many :news_feeds
  has_many :comments, dependent: :destroy

  def unread_news_count
    news_feeds.unread.count
  end

  def read_news_count
    news_feeds.read.count
  end

  def news_author?(news_item)
    news_item.user_id == self.id
  end
end
