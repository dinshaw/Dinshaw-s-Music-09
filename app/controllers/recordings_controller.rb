class RecordingsController < ApplicationController
  caches_page :index
  
  def index
    @recordings = Recording.all
  end

end
