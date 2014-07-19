#require 'delegate'

class NewsFeedDecorator# < SimpleDelegator

  def initialize(news_feed)
    @news_feed = news_feed
  end

  def news_status_class
    @news_feed.status.to_s == 'f' ? 'active fontBold' : ''
  end

  def news_status
    @news_feed.status.to_s == 'f' ? 'Unread' : 'Read'
  end

end
