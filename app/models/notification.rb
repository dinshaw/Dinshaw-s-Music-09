class Notification < ActiveRecord::Base
  attr_accessor :gig_id

  def gig_info
    gig = Gig.find(gig_id)
    <<-EOS
Upcoming Show!
Where: #{gig.venue.name}
When: #{gig.start_time.to_s(:gig)} to #{gig.end_time.to_s(:end_time)}

#{gig.description}
    EOS
  end
end
