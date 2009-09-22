class AdminController < ApplicationController
  # before_filter :login_required
  layout 'admin'

  def index
    redirect_to admin_cms_pages_path
  end

end
