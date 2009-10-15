class RecordingsController < ApplicationController
  caches_action :index
  
  def index
    @recordings = Recording.all
  end

end
