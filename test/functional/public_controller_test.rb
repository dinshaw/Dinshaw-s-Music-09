require 'test_helper'

class PublicControllerTest < ActionController::TestCase
  context "on home page" do
    setup do
      get :index
    end

    should_assign_to :gigs
    should_respond_with :success
    should_not_set_the_flash
  end
end
