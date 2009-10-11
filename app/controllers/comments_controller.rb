class CommentsController < InheritedResources::Base
  include InheritedResources::DSL
  respond_to :html, :xml, :js
  belongs_to :song, :recording, :recording_session, :polymorphic => true

  create! do |success, failure|
    failure.html { render :template => 'songs/show' }
    success.html { redirect_to song_url(@song) }
    success.js { render :template => 'songs/add_comment' }
  end
end
