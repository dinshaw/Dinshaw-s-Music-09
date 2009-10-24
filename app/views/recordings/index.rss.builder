xml.instruct! :xml, :version=>"1.0" 
xml.rss(:version=>"2.0") do
  xml.channel do
    xml.title "Dinshaw's Recordings"
    xml.link "http://dinshaw.us"
    xml.description "Original songs recorded by Dinshaw"
    xml.language 'en-us'
    @recordings.each do |recording|
      xml.item do
        xml.title recording.song.title
        xml.description recording.recording_session.title
        xml.pubDate recording.recording_session.start_date
        xml.link song_url(recording.song)
        xml.guid song_url(recording.song)
      end
    end
  end
end