require 'spec_helper'

describe NewsItem do
  it { should have_many(:news_feeds) }
  it { should have_many(:comments) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:user_id) }

  describe "#comment_with_user" do
    it "should return array of comments" do
      news_item = FactoryGirl.create(:news_item)
      user_1 = FactoryGirl.create(:user, email: "rake1@gmail.com")
      user_2 = FactoryGirl.create(:user, email: "rake2@gmail.com")
      comment_1 = FactoryGirl.create(:comment, news_item: news_item, user: user_1)
      comment_2 = FactoryGirl.create(:comment, news_item: news_item, user: user_2)
      comment_3 = FactoryGirl.create(:comment, news_item: news_item, user: user_1)
      news_item.comments_with_user.to_a.should eql [comment_3, comment_2, comment_1]
    end
  end

  describe "#update_news_feed!" do
    context "user with news feed" do
      it "mark news feed as read" do
        user = FactoryGirl.create(:user, email: "rake1@gmail.com")
        news_item = FactoryGirl.create(:news_item)
        news_feed = FactoryGirl.create(:news_feed, news_item: news_item, user: user)

        news_item.update_news_feed!(user.id).should eql true
        news_feed.reload
        news_feed.status.should eql true
      end
    end

    context "user with no news feed" do
      it "return nil" do
        user = FactoryGirl.create(:user, email: "rake1122@gmail.com")
        news_item = FactoryGirl.create(:news_item)
        news_feed = FactoryGirl.create(:news_feed, news_item: news_item, user: user)
        wrong_user_id = 1223

        news_item.update_news_feed!(wrong_user_id).should be_nil
        news_feed.reload
        news_feed.status.should eql false
      end
    end
  end

  describe "#create_feeds" do
    it "shouls create news feed for all users" do
      user_1 = FactoryGirl.create(:user)
      user_2 = FactoryGirl.create(:user)
      user_3 = FactoryGirl.create(:user)

      user_1.news_feeds.to_a.should eql []
      user_2.news_feeds.to_a.should eql []
      user_3.news_feeds.to_a.should eql []

      news_item = FactoryGirl.create(:news_item)

      [user_1, user_2, user_3].map(&:reload)

      user_1.news_feeds.first.should eql news_item.news_feeds.where(user_id: user_1.id).first
      user_2.news_feeds.first.should eql news_item.news_feeds.where(user_id: user_2.id).first
      user_3.news_feeds.first.should eql news_item.news_feeds.where(user_id: user_3.id).first
    end
  end

  describe ".with_user" do
    it "should return news_items with news_feed status" do
      user = FactoryGirl.create(:user)
      news_item_1 = FactoryGirl.create(:news_item)
      news_item_2 = FactoryGirl.create(:news_item)
      news_feed_1 = FactoryGirl.create(:news_feed, user: user, news_item: news_item_1)
      news_feed_2 = FactoryGirl.create(:news_feed, user: user, news_item: news_item_2)

      news_items = NewsItem.with_user(user.id)
      news_items.map(&:id).should eql [news_item_1.id, news_item_2.id]
      news_items.map(&:body).should eql [news_item_1.body, news_item_2.body]
    end
  end
end
