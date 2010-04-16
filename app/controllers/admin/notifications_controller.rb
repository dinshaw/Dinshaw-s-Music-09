class Admin::NotificationsController < AdminController
  admin_assistant_for Notification do |a|
    a.form do |form|
      form.columns :title, :body
      form[:title ].text_area_options = {:rows => 2}
      form[:body ].text_area_options = {:rows => 5}      
    end
    a.index do |index|
      index.columns :title, :body, :delivered_at
    end
    a.show.columns :title, :body
  end

  def show
    @notification = Notification.find(params[:id])
  end

  def deliver
    case Rails.env
    when 'development'
      notification = Notification.find(params[:id])
      User.active.unnotified(params[:id]).find(:all,  :limit => 3 ).each do |user|
        GigMailer.deliver_gig_notification(notification, user, notification.noteworthy)
        user.notify!(notification.id)
      end
    else
      Delayed::Job.enqueue( MailingJob.new(params[:id], 'gig')) 
    end
    flash[:notice] = 'Notifications being sent...'
    redirect_to admin_notifications_path
  end

  def get_gig
    @gig = Gig.find(params[:gig_id])
  end
end
