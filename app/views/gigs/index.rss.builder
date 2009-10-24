xml.instruct! :xml, :version=>"1.0" 
xml.rss(:version=>"2.0") do
  xml.channel do
    xml.title "Dinshaw's Gigs"
    xml.link "http://dinshaw.us"
    xml.description "Live performance schedule for Dinshaw"
    xml.language 'en-us'
    @gigs.each do |gig|
      xml.item do
        xml.title gig.venue.name
        xml.description gig.venue.location
        xml.link gig_url(gig)
        xml.guid gig_url(gig)
      end
    end
  end
end
