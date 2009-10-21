class User < ActiveRecord::Base
  acts_as_authorization_subject

  include AASM
  has_many :addresses, :as => :addressable

  acts_as_authentic do |c|
    c.login_field = :email
    c.validate_login_field = false
    c.validates_length_of_email_field_options(:within => 0..200)
    c.validates_uniqueness_of_email_field_options(:message => I18n.t('authlogic.error_messages.email_dup'))
    #TODO: why does this break the validation message?
    # c.validates_format_of_email_field_options(:with => VALID_EMAIL)
  end

  attr_accessible :email, :password, :password_confirmation

  aasm_initial_state :pending
  aasm_state :pending
  aasm_state :active

  aasm_event :activate do
    transitions :from => :pending, :to => :active
  end

  named_scope :unnotified, lambda{ |notification_id| { :conditions => ['last_notification <> ? OR last_notification is null', notification_id] } }

  def deliver_password_reset_instructions!
    reset_perishable_token!
    UserMailer.deliver_password_reset_instructions(self)
  end

  def notify!(notification_id)
    update_attribute :last_notification, notification_id
  end
end
