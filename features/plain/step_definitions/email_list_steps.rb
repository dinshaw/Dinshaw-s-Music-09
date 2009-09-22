Given /^there is a user with email "([^\"]*)"$/ do |arg1|
  User.create(:email => 'info@dinshaw.us', :password => 'password', :password_confirmation => 'password')
end