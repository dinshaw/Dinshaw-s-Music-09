xml.instruct!
xml.songs do
  @recordings.each do |recording|
    xml.song do
      xml.id recording.id
      xml.title recording.song.title
      xml.artist 'Dinshaw'
      xml.album 'Dinshaw'
      xml.url recording.track.url
      xml.recording_session recording.recording_session.title
    end
  end
end
