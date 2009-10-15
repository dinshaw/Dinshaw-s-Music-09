require 'test_helper'

class Admin::NotificationsControllerTest < ActionController::TestCase
  context 'generate notification' do
    setup do
      @time = Time.now
      @venue = Venue.make(:name => 'The River')
      @gig = Gig.make(
      :venue => @venue,
      :time_start => @time,
      :time_end => Time.now + 2.hours,
      :description => 'My band playing live!'
      )
      Gig.stubs(:find).returns(@gig)

      @gig_info = <<-EOS
Dinshaw Live!

My band playing live!

Where: The River
When: #{@time.to_s(:gig)} to #{(@time+2.hours).to_s(:time_end)}
      EOS

      get :new, :gig_id => 1
    end

    should_assign_to :notification
    # assert_equal assigns[:notification].body, @body_text

  end
end
