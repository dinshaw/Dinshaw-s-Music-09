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
  
  def new
    @notification = Notification.new
    @notification.body =  @notification.gig_info(params[:gig_id])
    @notification.title =  @notification.gig_subject(params[:gig_id])    
  end
  
  def show
    @notification = Notification.find(params[:id])
  end
  
  def deliver
    Delayed::Job.enqueue( MailingJob.new(params[:id]), -3 ) 
    flash[:notice] = 'Notifications being sent...'
    redirect_to admin_notifications_path
  end
  
  def get_gig
    @gig = Gig.find(params[:gig_id])
  end
end
