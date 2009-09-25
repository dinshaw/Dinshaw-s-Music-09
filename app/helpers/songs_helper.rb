module SongsHelper
  def recordings_html_for_index(song)
    song.recordings.map do |r| 
      link_to r.recording_session.title, admin_recording_path(r)
    end.to_sentence
  end

end
