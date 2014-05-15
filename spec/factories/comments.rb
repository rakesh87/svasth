FactoryGirl.define do

  factory :comment do
    body "comment body for test"
    user_id 12
    news_item_id 21
  end

  factory :invalid_comment, parent: :comment do
    body ""
  end

  # factory :comment_with_user, parent: :comment do |comment|
  #   comment.user = FactoryGirl.create(:user, email: "rak123@gmail.com")
  # end

end
