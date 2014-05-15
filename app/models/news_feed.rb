class NewsFeed < ActiveRecord::Base
  belongs_to :user
  belongs_to :news_item

  validates_presence_of :user, :news_item
  validates :user_id, uniqueness: { scope: :news_item_id }

  scope :read, -> { where(status: true) }
  scope :unread, -> { where(status: false) }
end
