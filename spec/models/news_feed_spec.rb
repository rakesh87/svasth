require 'spec_helper'

describe NewsFeed do
  it { should belong_to(:user) }
  it { should belong_to(:news_item) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:news_item) }
  it { should validate_uniqueness_of(:user_id).scoped_to(:news_item_id) }
end
