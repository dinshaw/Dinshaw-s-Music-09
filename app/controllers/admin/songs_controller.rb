class Admin::SongsController < AdminController
  cache_sweeper :song_sweeper, :only => [:create, :update, :destroy]

  admin_assistant_for Song do |a|
    # a.actions << :destroy
    a.index do |index|
      index.columns :title, :recordings
    end      
    a.form do |form|
      form[:lyrics ].text_area_options = {:rows => 5}
      form[:notes ].text_area_options = {:rows => 5}      
      form[:composition_date].date_select_options = {:start_year => 1988,:discard_day => true}
    end
  end

  protected
  
  # This is run after all saves, whether they're creates or updates
  def after_save(song)
    expire_page song_url(song)
    expire_page 'songs'
  end
end