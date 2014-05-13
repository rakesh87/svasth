require "spec_helper"

describe User do
  it { should have_many(:news_items).through(:news_feeds) }
  it { should have_many(:news_feeds) }
  it { should have_many(:comments) }

end
