class UserMailer < ActionMailer::ARMailer
  @@number_of_accounts = 92
  @@start = 105
  
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Email list confirmation. Important! You must confirm to get emails!'
    @body[:url]  = "http://#{`hostname`.chomp}/activate/#{user.activation_code}"
  end


  def notification(notification, user)
    setup_email(user)
    from @from
    @subject    += notification.title
    @body[:text]  = notification.body    
    @body[:url]  = "http://#{`hostname`.chomp}/activate/#{user.activation_code}"
  end

  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @body[:url]  = "http://#{`hostname`.chomp}/"
  end

  protected
  def setup_email(user)
    set_smtp_settings
    @headers['Reply-to'] = "DINSHAWW <info@dinshaw.us>"    
    @recipients  = "#{user.email}"
    @from        = "#{SITE_NAME} <#{ActionMailer::Base.smtp_settings[:user_name]}>"
    @subject     = "#{SITE_NAME}: "
    @sent_on     = Time.now
    @body[:user] = user
  end
  
  def set_smtp_settings
    number = rand(@@number_of_accounts).floor + @@start
    ActionMailer::Base.smtp_settings[:user_name] = "system_#{number}@dinshaw.us"
  end
end
