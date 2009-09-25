class Admin::RecordingsController < AdminController
  admin_assistant_for Recording do |a|
    a.actions << :destroy
      a.index do |index|
        index.columns :track, :song, :recording_session
      end      
      a.form do |form|
        form[:lyrics ].text_area_options = {:rows => 5}
        form[:notes ].text_area_options = {:rows => 5}      
        form[:composition_date].date_select_options = {:start_year => 1988,:discard_day => true}
      end
  end
end
