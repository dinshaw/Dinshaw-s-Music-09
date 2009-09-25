class AdminController < ApplicationController
  # before_filter :login_required
  layout 'admin'

  def index
    redirect_to admin_songs_path
  end

end
