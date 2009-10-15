class PublicController < ApplicationController
  before_filter :new_user
  caches_action :index
  
  def index
    @gigs = Gig.upcoming
    @display_email_list = true
  end
end
