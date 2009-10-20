class MailingJob < Struct.new(:notification_id)
  def perform
    notification = Notification.find(notification_id)
    User.active.unnotified(notification_id).each do |user|
      UserMailer.deliver_notification(notification, user)
      user.notify!(notification_id)
    end
  end
end