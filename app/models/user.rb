class User < ActiveRecord::Base
  include AASM
  
  acts_as_authentic do |c|
    c.login_field = :email
    c.validate_login_field = false
    c.validates_length_of_email_field_options(:within => 0..200)
  end
  
  attr_accessible :email, :password, :password_confirmation 
  
  aasm_initial_state :pending
  aasm_state :pending
  aasm_state :active

  aasm_event :activate do
    transitions :from => :pending, :to => :active 
  end
end