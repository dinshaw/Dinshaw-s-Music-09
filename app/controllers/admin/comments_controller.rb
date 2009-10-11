class Admin::CommentsController < AdminController
 admin_assistant_for Comment do |aa|
   aa.actions << :destroy
 end
end