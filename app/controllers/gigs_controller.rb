class GigsController < InheritedResources::Base
  respond_to :html, :js, :rss
  actions :index, :show
  caches_page :index, :show

  protected
  def collection
    @gigs ||= Gig.upcoming
  end
end
