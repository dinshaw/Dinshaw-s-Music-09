class CommentsController < InheritedResources::Base
  include InheritedResources::DSL
  respond_to :html, :rss, :js
  belongs_to :song, :recording, :recording_session, :polymorphic => true, :optional => true
  caches_page :index
  cache_sweeper :comment_sweeper, :only => [:create]
  
  create! do |success, failure|
    failure.html { render :template => 'songs/show' }
    success.html { redirect_to song_url(@song) }
    success.js { render :template => 'songs/add_comment' }
    expire_page song_path(@song)
  end
end
