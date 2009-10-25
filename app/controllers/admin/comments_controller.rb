class Admin::CommentsController < AdminController
  cache_sweeper :comment_sweeper, :only => [:create, :update, :destroy]
  admin_assistant_for Comment do |aa|
    aa.actions << :destroy
  end
end