require 'test_helper'

class GigTest < ActiveSupport::TestCase
  should_belong_to :venue
  should_belong_to :recording_session
  
  context 'upcoming scope' do
    setup do
      @past_gig = Gig.make(:time_start => Time.now - 2.day)
      @first_gig = Gig.make(:time_start => Time.now + 1.day)
      @second_gig = Gig.make(:time_start => Time.now + 2.days)
      @third_gig = Gig.make(:time_start => Time.now + 3.days)
    end
    should 'return future gigs starting with the closest' do
      assert_equal Gig.upcoming.size, 3
      assert_equal Gig.upcoming, [@first_gig, @second_gig, @third_gig]      
    end
  end
  context 'upcoming booean' do
    should 'return true if the gig is in the future' do
      assert_equal Gig.make(:time_start => Time.now + 3.days).upcoming?, true
    end
    should 'return false if the gig is in the past' do
      assert_equal Gig.make(:time_start => Time.now - 3.days).upcoming?, false
    end
  end
end
