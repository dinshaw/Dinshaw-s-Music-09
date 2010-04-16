class Admin::CommentsController < AdminController
  cache_sweeper :comment_sweeper, :only => [:create, :update, :destroy]
  admin_assistant_for Comment do |aa|
    aa.actions << :destroy
    aa.index do |index|
      index.columns :name, :email, :url, :body, :created_at
    end
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
end