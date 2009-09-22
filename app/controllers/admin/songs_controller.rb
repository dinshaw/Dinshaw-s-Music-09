class Admin::SongsController < AdminController
  admin_assistant_for Song do |a|
    a.actions << :destroy
    a.form do |form|
      form[:lyrics ].text_area_options = {:rows => 5}
      form[:notes ].text_area_options = {:rows => 5}      
      form[:composition_date].date_select_options = {:start_year => 1988,:discard_day => true}
    end
  end

end