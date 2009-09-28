require 'test_helper'

class GigHelperTest < ActiveSupport::TestCase
  include GigHelper
  context 'helping' do
    setup do
      @time = Time.now
      @gig = Gig.make(:time_start => @time, :time_end => @time + 2.hours)
    end

    should 'format the time with start and end' do
      assert_equal [@time.strftime(GIG_TIME_FORMAT), 'to', (@time + 2.hours).strftime(GIG_TIME_FORMAT)].join(" "),  show_time(@gig)
    end

    should 'format the time with just start' do
      assert_equal show_time(@gig, :start => false), (@time+2.hours).strftime(GIG_TIME_FORMAT)
    end

    should 'format the time with just end' do
      assert_equal show_time(@gig, :end => false), @time.strftime(GIG_TIME_FORMAT)
    end
  end
end
