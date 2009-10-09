require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  context 'valid' do
    setup do
      @time = Time.now
      @venue = mock('Venu', :name => 'The River')
      @gig = mock('Gig', :venue => @venue, :start_time => @time, :end_time => Time.now + 2.hours, :description => 'My band playing live!')
      Gig.stubs(:find).returns(@gig)

      @gig_info = <<-EOS
Upcoming Show!
Where: The River
When: #{@time.to_s(:gig)} to #{(@time+2.hours).to_s(:end_time)}

My band playing live!
      EOS
      @notification = Notification.new(:gig_id => @gig)
    end

    should 'format gig information' do
      assert_equal @notification.gig_info, @gig_info
    end
  end
end
