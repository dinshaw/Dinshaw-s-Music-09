module SongHelper
  def recordings_html_for_index(song)
    song.recordings.map do |r| 
      link_to r.recording_session.title, admin_recording_path(r)
    end.to_sentence
  end
  
  def poem_html_for_index(song)
    is song.poem
  end
  
  def bitly_html_for_index(song)
    link_to(song.bitly, song.bitly, :class => :external) if !song.bitly.blank?
  end
end
