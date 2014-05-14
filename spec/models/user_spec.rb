require "spec_helper"

describe User do
  it { should have_many(:news_items).through(:news_feeds) }
  it { should have_many(:news_feeds) }
  it { should have_many(:comments).dependent(:destroy) }

  describe "#unread_news_count" do
    before do
      @user = FactoryGirl.create(:user)
      @user.stub!(:unread_news_count).and_return(3)
    end
    it "should return unread news count" do
      @user.unread_news_count.should eql 3
    end
  end

  describe "#read_news_count" do
    before do
      @user = FactoryGirl.create(:user)
      @user.stub!(:read_news_count).and_return(5)
    end
    it "should return read news count" do
      @user.read_news_count.should eql 5
    end
  end

  describe "#news_author?" do
    context "news author" do
      it "should return true for news author user" do
        user = FactoryGirl.create(:user)
        news_item = FactoryGirl.create(:news_item, user_id: user.id)
        user.news_author?(news_item).should eq true
      end
    end
    context "normal user" do
      it "should return false for normal user" do
        user = FactoryGirl.create(:user)
        news_item = FactoryGirl.create(:news_item)
        user.news_author?(news_item).should eq false
      end
    end
  end

end
