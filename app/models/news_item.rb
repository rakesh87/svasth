class NewsItem < ActiveRecord::Base
  has_many :news_feeds
  has_many :comments, dependent: :destroy

  validates :body, presence: true

  after_create :create_news_feeds

  scope :with_user, ->(user_id) {
    joins(:news_feeds)
    .where('news_feeds.user_id = ?', user_id)
    .select('news_items.id, news_items.body, news_feeds.status AS status')
  }

  def comments_with_user
    comments.with_user
  end

  private

  def create_news_feeds
    User.all.each do |user|
      news_feeds.create(user_id: user.id)
    end
  end

end
