class RecordingsController< InheritedResources::Base
  respond_to :html, :xml, :js, :rss
  actions :index, :show
  caches_page :index, :show, :for_player

  def for_player
    @recordings = Recording.for_player
  end

end
