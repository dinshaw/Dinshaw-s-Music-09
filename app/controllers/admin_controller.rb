class AdminController < ApplicationController
  htpasswd :user=>"dinshaw", :pass=>"Y/bHA8xEf{vTQ6RKDk" unless RAILS_ENV == 'development'

  # before_filter :login_required
  layout 'admin'


  def index
    redirect_to admin_songs_path
  end

end
