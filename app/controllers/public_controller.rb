class PublicController < ApplicationController
  before_filter :new_user
  caches_page :index, :contact, :privacy, :unsubscribe
  
  def index
    @gigs = Gig.upcoming
    @display_email_list = true
  end
end
