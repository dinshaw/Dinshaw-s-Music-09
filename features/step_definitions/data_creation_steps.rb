# data creation
Given /^there (?:are|is) "([^\"]*)" "([^\"]*)" named "([^\"]*)"$/ do |num, items, names|
  case items
  when 'upcoming gigs', 'upcoming gig'
    split_names(names).each do |name| 
      Gig.make(:venue => Venue.make(:name => name, :location => "Location of #{name}", :directions => "Directions to #{name}"))
    end
    
  when 'songs', 'song'
    @recording_session = RecordingSession.make
    split_names(names).each do |name| 
      @song = Song.make(:title => name, :lyrics => "Lorem ipsum", :composition_date => 1.year.ago, :composition_location => "NYC")
      Recording.make(:song => @song, :recording_session => @recording_session )
      Recording.make(:song => @song, :recording_session => @recording_session )
    end
  end
end

def split_names(names)
  names.split(/and|,/).map{ |name| name.strip if !name.blank? }.compact
end