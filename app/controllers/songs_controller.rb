class SongsController < InheritedResources::Base
  before_filter :new_comment, :only => :show
  respond_to :html, :xml, :js, :rss
  actions :index, :show
  caches_page :index, :show
end
