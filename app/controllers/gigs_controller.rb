class GigsController < InheritedResources::Base
  respond_to :html, :xml, :js
  actions :index, :show
  caches_page :index

  protected
  def collection
    @gigs ||= Gig.upcoming
  end
end
