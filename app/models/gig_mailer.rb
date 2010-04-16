class GigMailer < ActionMailer::Base
  @@number_of_accounts = 92
  @@start = 105

  def gig_notification(notification, user, gig)
    setup_email(user)
    @subject += notification.title
    @body[:text] = notification.body
    @body[:gig] = gig
  end

  protected
  def setup_email(user)
    set_smtp_settings
    @headers['Reply-to'] = "DINSHAW <info@dinshaw.us>"
    @recipients  = user.email
    @from        = "#{SITE_NAME} <#{ActionMailer::Base.smtp_settings[:user_name]}>"
    from @from
    @subject     = "#{SITE_NAME}: "
    @sent_on     = Time.now
    @body[:user] = user
  end

  def set_smtp_settings
    number = rand(@@number_of_accounts).floor + @@start
    ActionMailer::Base.smtp_settings[:user_name] = "system_#{number}"
  end
end
