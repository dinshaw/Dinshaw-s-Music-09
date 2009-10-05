require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  context 'routing' do
    should_route :post, "/unsubscribe", :action => :unsubscribe
  end

  context 'with get not fail' do
    setup do
      get :unsubscribe
    end
    should_respond_with :success=
  end
  
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

  context "unsubscribing" do
    setup do
      @user = User.make(:email => 'test@tester.com')
    end

    context 'with no email' do
      setup do
        post :unsubscribe, "user" => { :email => '' }
      end
      should_respond_with :success
      should_set_the_flash_to 'Email address not found: .'
      should_render_template :unsubscribe
      should_change("User count", :by => 0) { User.count }
    end

    context 'with bad email' do
      setup do
        post :unsubscribe, "user" => { :email => 'asd@asd.com' }
      end
      should_respond_with :success
      should_set_the_flash_to 'Email address not found: asd@asd.com.'
      should_render_template :unsubscribe
      should_change("User count", :by => 0) { User.count }
    end

    context 'with good email' do
      setup do
        post :unsubscribe, "user" => { :email => 'test@tester.com' }
      end
      should_redirect_to("the home page") { root_url }
      should_set_the_flash_to /removed/
      should_change("User.count", :from => 1, :to => 0) { User.count }
    end
  end
end