require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  context 'valid' do
    setup do
      @time = Time.now
      @venue = mock('Venu')
      @venue.stubs(:name).returns('The River')
      @venue.stubs(:location).returns('10 ave between 42 and 43')
      @venue.stubs(:url).returns('http://theriver.com')  
      @venue.stubs(:directions).returns('A, C, or E to 42nd st.')      
      @gig = mock('Gig')
      @gig.stubs(:venue).returns(@venue)
      @gig.stubs(:time_start).returns(@time)
      @gig.stubs(:time_end).returns(Time.now + 2.hours)
      @gig.stubs(:description).returns('My band playing live!')
      
      Gig.stubs(:find).returns(@gig)

      @gig_info = <<-EOS
Dinshaw Live!

My band playing live!

Where: The River (http://theriver.com)
10 ave between 42 and 43
A, C, or E to 42nd st.

When: #{@time.to_s(:gig)} to #{(@time+2.hours).to_s(:time_end)}
      EOS
      
      @gig_subject = "Live at The River: #{@time.to_s(:gig)}"
      @notification = Notification.new
    end

    should 'format gig information' do
      assert_equal @notification.gig_info(1), @gig_info
      assert_equal @notification.gig_subject(1), @gig_subject
    end
  end
end

