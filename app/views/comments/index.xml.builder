xml.instruct!
xml.comments do
  xml.for_song @song.tit
  @comments.each do |comment|
    xml.comment do
      xml.id comment.id
      xml.artist do
        xml.name 'Dinshaw'      
        xml.website 'http://www.dinshaw.us'
      end
      xml.venue do
        xml.name comment.venue.name
        xml.location comment.venue.location
        xml.directions comment.venue.directions        
      end
      xml.time do
        xml.start comment.time_start.to_s(:comment)
        xml.end comment.time_end.to_s(:comment)        
      end
    end
  end
end
