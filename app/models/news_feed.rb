class NewsFeed < ActiveRecord::Base
  belongs_to :user
  belongs_to :news_item

  scope :read, -> { where(status: true) }
  scope :unread, -> { where(status: false) }
end
