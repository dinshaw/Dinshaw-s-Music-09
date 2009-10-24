xml.instruct! :xml, :version=>"1.0" 
xml.rss(:version=>"2.0") do
  xml.channel do
    xml.title "Dinshaw's Songs"
    xml.link "http://dinshaw.us"
    xml.description "Original songs written by Dinshaw"
    xml.language 'en-us'
    @songs.each do |song|
      xml.item do
        xml.title song.title
        xml.description song.lyrics
        xml.pubDate song.composition_date
        xml.link song_url(song)
        xml.guid song_url(song)
      end
    end
  end
end