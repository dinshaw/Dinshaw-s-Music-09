class Admin::NotificationsController < AdminController
  admin_assistant_for Notification do |a|
    a.form do |form|
      form.columns :title, :body
      form[:title ].text_area_options = {:rows => 2}
      form[:body ].text_area_options = {:rows => 5}      
    end
    a.show.columns :title, :body
  end
  
  def show
    @notification = Notification.find(params[:id])
  end
  
  def deliver
    Delayed::Job.enqueue( MailingJob.new(params[:notification_id]), -3 ) 
    flash[:message] = 'Notifications being sent...'
  end
end
