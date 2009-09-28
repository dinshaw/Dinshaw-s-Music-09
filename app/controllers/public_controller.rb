class PublicController < ApplicationController
  before_filter :new_user
  def index
    @gigs = Gig.upcoming
  end

end
