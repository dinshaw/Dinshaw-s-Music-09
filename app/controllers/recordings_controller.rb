class RecordingsController< InheritedResources::Base
 respond_to :html, :xml, :js, :rss
 actions :index, :show
 caches_page :index, :show
end
