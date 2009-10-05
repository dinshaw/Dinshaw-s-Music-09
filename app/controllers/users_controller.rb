class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  def activate
    User.find_using_perishable_token!(params[:perishable_token]).activate!
  rescue ActiveRecord::RecordNotFound
    flash[:error] = I18n.t('flash.user.activate.not_found')
  ensure
    redirect_back_or_default('/')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    # set a flag for the emial list
    @email_list = params[:email_list]    

    if @user.save
      flash[:message] = I18n.t('flash.user.create.success')
      # pass email to DelayedJob
      UserMailer.send_later(:deliver_signup_notification, @user)
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js { render :action => :success }
      end
    else
      respond_to do |format|
        format.html { render :action => :new }
        format.js { render :action => :new }
      end
    end
  end

  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end

  def unsubscribe
    if request.post?
      @user = User.find_by_email(params[:user][:email])
      if @user
        @user.destroy
        flash[:success] = "Your email has been removed."
        respond_to do |format|
          format.html { redirect_to root_url }
          format.js { render :action => :unsubscribe_success }
        end
      else
        flash[:error] = "Email address not found: #{params[:user][:email]}."
        respond_to do |format|
          format.html
          format.js
        end
      end
    end
  end
end