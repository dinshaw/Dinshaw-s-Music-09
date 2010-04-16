module NotificationHelper
  def body_html_for_index(notification)
    truncate notification.body
  end
end