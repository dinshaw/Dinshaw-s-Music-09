class MailingJob < Struct.new(:notification_id, :kind)
  def perform
    notification = Notification.find(notification_id)
    
    User.active.unnotified(notification_id).each do |user|
      case kind
      when 'gig'
        GigMailer.deliver_gig_notification(notification, user)
      end
      user.notify!(notification_id)
    end
  end
end