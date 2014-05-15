class NewsItem < ActiveRecord::Base
  has_many :news_feeds
  has_many :comments, dependent: :destroy

  validates :body, presence: true
  validates :user_id, presence: true

  scope :with_user, ->(user_id) {
    joins(:news_feeds)
    .where('news_feeds.user_id = ?', user_id)
    .select('news_items.id, news_items.body, news_feeds.status AS status')
  }

  def comments_with_user
    comments.with_user
  end

  def update_news_feed!(current_user_id)
    news_feed = news_feeds.where(user_id: current_user_id).first
    news_feed && news_feed.update(status: true)
  end

  def create_feeds
    transaction do
      User.select(:id).find_each(batch_size: 100).map do |user|
        news_feeds.create(user_id: user.id)
      end
    end

    # self.class.connection.execute <<-EOS
    #   INSERT INTO news_feeds (`news_item_id`, `user_id`) VALUES #{feed_values.join(", ")}
    # EOS
  end

end
