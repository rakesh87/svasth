FactoryGirl.define do

  factory :news_item do |ni|
    ni.sequence(:id)    { |n| "#{n}" }
    ni.body "comment body for test"
    ni.user_id 234
  end

  factory :invalid_news_item, parent: :news_item do
    body ''
  end

end
