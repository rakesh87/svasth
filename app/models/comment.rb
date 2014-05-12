class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :news_item

  scope :with_user, -> { joins(:user).select('users.email AS user_email, comments.body')}
end
