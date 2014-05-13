require 'spec_helper'

describe NewsFeed do
  it { should belong_to(:user) }
  it { should belong_to(:news_item) }

  describe "instantiation" do
    let(:news_feed) { FactoryGirl.build(:news_feed) }
    it 'instantiates a NewsFeed' do
      expect(news_feed.class.name).to eq("NewsFeed")
    end
  end
end
