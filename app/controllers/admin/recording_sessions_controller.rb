class Admin::RecordingSessionsController < AdminController
  admin_assistant_for RecordingSession do |a|
    # a.actions << :destroy
    a.form do |form|
      form[:description ].text_area_options = {:rows => 5}
      form[:start_date].date_select_options = {:include_blank => false, :default => Date.today}
      form[:end_date].date_select_options = {:include_blank => false, :default => Date.today}      
    end
  end
  
end
