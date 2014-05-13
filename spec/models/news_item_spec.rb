require 'spec_helper'

describe NewsItem do
  it { should have_many(:news_feeds) }
  it { should have_many(:comments) }
  it { should validate_presence_of(:body) }

  describe "instantiation" do
    let(:news_item) { FactoryGirl.build(:news_item) }
    it 'instantiates a NewsItem' do
      expect(news_item.class.name).to eq("NewsItem")
    end
  end
end
