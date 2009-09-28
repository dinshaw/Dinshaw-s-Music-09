require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  context "on create user" do
    setup do
      post :create, "user" => User.plan
    end

    should_assign_to :user
    should_respond_with :redirect
    should_change("User count", :by => 1) { User.count }
  end
  
  context "on user params error" do
    setup do
      post :create, "user" => User.plan(:password => 'badpass')
    end

    should_assign_to :user
    should_respond_with :success
    should_render_template :new
    should_change("User count", :by => 0) { User.count }
  end
end
