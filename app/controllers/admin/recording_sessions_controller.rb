class Admin::RecordingSessionsController < AdminController
  admin_assistant_for RecordingSession do |a|
    # a.actions << :destroy
    a.form do |form|
    end
  end
  
end
