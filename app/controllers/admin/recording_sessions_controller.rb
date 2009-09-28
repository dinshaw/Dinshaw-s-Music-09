class Admin::RecordingSessionsController < AdminController
  admin_assistant_for RecordingSession do |a|
    # a.actions << :destroy
    a.form do |form|
      form[:description ].text_area_options = {:rows => 5}
    end
  end
  
end
