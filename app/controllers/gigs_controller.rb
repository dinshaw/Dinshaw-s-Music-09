class GigsController < InheritedResources::Base
  respond_to :html, :xml, :js
  actions :index, :show
  caches_action :index, :show

  protected
  def collection
    @gigs ||= Gig.upcoming
  end
end
