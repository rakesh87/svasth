require 'spec_helper'

describe Comment do
  it { should belong_to(:user) }
  it { should belong_to(:news_item) }
  it { should validate_presence_of(:body) }

  describe "instantiation" do
    let(:comment) { FactoryGirl.build(:comment) }
    it 'instantiates a comment' do
      expect(comment.class.name).to eq("Comment")
    end
  end
end
