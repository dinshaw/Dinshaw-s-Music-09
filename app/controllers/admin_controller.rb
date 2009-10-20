class AdminController < ApplicationController
  access_control do
    allow :superuser
  end

  rescue_from 'Acl9::AccessDenied', :with => :access_denied
  htpasswd :user=>"dinshaw", :pass=>"Y/bHA8xEf{vTQ6RKDk" unless ['development','test','staging'].include?(RAILS_ENV)

  # before_filter :login_required
  layout 'admin'

  def index
    redirect_to admin_songs_path
  end

end
