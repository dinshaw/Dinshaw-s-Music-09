class MailingJob < Struct.new(:notification_id)
  def perform
    noification = Notification.find(notification_id)
    users = User.active.unnotified(notification_id).each do |user|
      UserMailer.deliver_notification(notification, user)
      user.notify!(notification_id)
    end
  end
end