class Notification < ActiveRecord::Base

  def gig_info(gig_id)
    gig = Gig.find(gig_id)
    <<-EOS
Dinshaw Live!

#{gig.description}

Where: #{gig.venue.name} #{['(',gig.venue.url,')'].join if !gig.venue.url.blank?}
#{gig.venue.location}
#{gig.venue.directions}

When: #{gig.time_start.to_s(:gig)} to #{gig.time_end.to_s(:time_end)}
    EOS
  rescue
  end
  
  def gig_subject(gig_id)
    gig = Gig.find(gig_id)
    ['Live at',gig.venue.name+':', gig.time_start.to_s(:gig),'to',gig.time_end.to_s(:time_end)].join(" ")
  end
end
