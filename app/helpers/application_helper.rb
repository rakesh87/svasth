module ApplicationHelper
  def news_item_status(status)
    status.to_s == 'f' ? 'Unread' : 'Read'
  end

  def news_item_class(status)
    status.to_s == 'f' ? 'active' : ''
  end
end
