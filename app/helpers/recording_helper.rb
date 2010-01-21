module RecordingHelper
  def song_html_for_index(recording)
    link_to recording.song.title, admin_song_path(recording.song)
  end
  def track_file_name_html_for_index(recording)
    "render :partial => 'recording', :locals => { :recording => recording }"
  end
  def in_player_rotation_html_for_index(recording)
    is(recording.in_player_rotation)
  end
end
