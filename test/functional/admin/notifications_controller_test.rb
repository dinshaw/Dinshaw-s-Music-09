require 'test_helper'

class Admin::NotificationsControllerTest < ActionController::TestCase
  context 'generate notification' do
    setup do
      @user = User.make
      @user.has_role!(:superuser)
      @controller.stubs(:current_user).returns(@user)
      @time = Time.now
      @venue = Venue.make(:name => 'The River', :description => '',  :location => '', :directions => '')
      @gig = Gig.make(
      :venue => @venue,
      :time_start => @time,
      :time_end => @time + 2.hours,
      :description => 'My band playing live!'
      )
      Gig.stubs(:find).returns(@gig)
      get :new_from_gig, :gig_id => 1
    end

    should_assign_to :notification
    should "generate the body text" do
      assert_equal assigns(:notification).body, assigns(:notification).gig_info(1)
    end

  end
end
