require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should_not_allow_mass_assignment_of :crypted_password
  should_not_allow_values_for :email, "blah", "b lah" 
  should_allow_values_for :email, "a@b.com", "asdf@asdf.com"
end
