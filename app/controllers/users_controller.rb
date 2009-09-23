class UsersController < ApplicationController

  # Protect these actions behind an admin login
  before_filter :login_reqired, :only => [:suspend, :unsuspend, :destroy, :purge]

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    @user.register! if @user && @user.valid?
    success = @user && @user.valid?
    
    if success && @user.errors.empty?      
      flash[:message] = "Thank you for signing up! We have sent a confirmation email to #{@user.email}. Check your junk mail if you don't see it in a few minutes." 
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js { render :template => 'users/success', :layout => false }
      end
    else
      flash[:error] = @user.errors.on(:email).is_a?(Array) ? @user.errors.on(:email).first : @user.errors.on(:email)    
      respond_to do |format|
        format.html 
        format.js
      end
    end
  end
  
  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "Signup complete! Please sign in to continue."
      redirect_to '/login'
    when params[:activation_code].blank?
      flash[:error] = "The activation code was missing.  Please follow the URL from your email."
      redirect_back_or_default('/')
    else 
      flash[:error]  = "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_back_or_default('/')
    end
  end

  def unsubscribe
    if request.post?
      user = User.find_by_email(params[:user][:email])
      if user
        user.delete!
        flash[:message] = "You have been removed."
      else
        flash[:message] = "Bad email"
      end
    end
  end

end
