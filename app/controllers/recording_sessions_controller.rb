class RecordingSessionsController< InheritedResources::Base
  respond_to :html, :xml, :js
  actions :index, :show
  caches_action :index, :show  
end
