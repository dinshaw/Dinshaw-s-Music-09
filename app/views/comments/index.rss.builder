xml.instruct! :xml, :version=>"1.0" 
xml.rss(:version=>"2.0") do
  xml.channel do
    xml.title ["Comments", (@song.title if @song)].compact.join(" for ") + [" ","(",@comments.count.to_s,")"].join
    xml.link @song ? song_url(@song) : "http://dinshaw.us"
    xml.description "Comments for songs by Dinshaw"
    xml.language 'en-us'
    @comments.each do |comment|
      xml.item do
        xml.title "By: #{comment.name}"
        xml.description comment.body
        xml.pubDate comment.created_at
        xml.link @song ? song_url(@song) : "http://dinshaw.us"
        xml.guid comment_url(comment)
      end
    end
  end
end
