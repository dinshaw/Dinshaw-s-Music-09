class SongsController < InheritedResources::Base
  before_filter :new_comment, :only => :show
  respond_to :html, :xml, :js
  actions :index, :show
  caches_page :index, :show
end
