require 'test_helper'

class GigHelperTest < ActiveSupport::TestCase
  include GigHelper
  context 'helping' do
    setup do
      @time = Time.now
      @gig = Gig.new
      @gig.stubs(:time_start).returns(@time)
      @gig.stubs(:time_end).returns(@time+2.hours)      
    end

    should 'format the time with start and end' do
      assert_equal [@time.to_s(:gig), 'to', (@time + 2.hours).to_s(:time_end)].join(" "),  show_time(@gig)
    end

    should 'format the time with just end' do
      assert_equal show_time(@gig, :end => false), @time.to_s(:gig)
    end
  end
end