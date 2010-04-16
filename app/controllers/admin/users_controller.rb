class Admin::UsersController < AdminController
  admin_assistant_for User do |a|
    a.actions << :destroy      
    a.form do |form|
      form.columns :email
    end
    a.index do |index|
      index.columns :email, :aasm_state, :created_at
    end
    a.show.columns :email, :aasm_state, :created_at, :single_access_token, :perishable_token
  end
  
  def resend_activation
    user = User.find(params[:id])
    UserMailer.send_later(:deliver_signup_notification, user)
    redirect_to admin_users_path
  end
  
  def show
    @user = User.find(params[:id])
  end
end