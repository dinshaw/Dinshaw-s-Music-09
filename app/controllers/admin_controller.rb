class AdminController < ApplicationController
  access_control do
    allow :superuser
  end

  rescue_from 'Acl9::AccessDenied', :with => :access_denied

  # before_filter :login_required
  layout 'admin'

  def index
    redirect_to admin_songs_path
  end

end
