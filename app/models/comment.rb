class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :news_item

  validates :body, presence: true

  scope :with_user,
    -> { joins(:user).select('users.email AS user_email, comments.body')
      .order('comments.created_at DESC')}
end
