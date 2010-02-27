class SongsController < InheritedResources::Base
  before_filter :new_comment, :only => :show
  respond_to :html, :xml, :js, :rss
  actions :index, :show
  caches_page :index, :show
  def index
    @songs = Song.songs
  end
  def poems
    @poems = Song.poems
  end
end
