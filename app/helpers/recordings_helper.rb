module RecordingsHelper
  def song_html_for_index(recording)
    link_to recording.song.title, admin_song_path(recording.song)
  end
  def track_html_for_index(recording)
    link_to recording.track.file_name, recording.track.url
  end
end
