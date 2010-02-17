class Admin::RecordingsController < AdminController
  cache_sweeper :recording_sweeper, :only => [:create, :update, :destroy]

  admin_assistant_for Recording do |a|
    a.actions << :destroy
    a.index do |index|
      index.columns :song, :recording_session, :in_player_rotation
    end      
    a.form do |form|
      form[:lyrics ].text_area_options = {:rows => 5}
      form[:notes ].text_area_options = {:rows => 5}      
      form[:composition_date].date_select_options = {:start_year => 1988,:discard_day => true}
    end
  end
end
