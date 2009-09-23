require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  include Authorization::AasmRoles

  has_and_belongs_to_many :roles
  
  # has_role? simply needs to return true or false whether a user has a role or not.  
  # It may be a good idea to have "admin" roles return true always
  def has_role?(role_in_question)
    @_list ||= self.roles.collect(&:name)
    return true if @_list.include?("admin")
    (@_list.include?(role_in_question.to_s) )
  end
  # ---------------------------------------
  
  validates_presence_of     :email, :message => 'Are you trying to signup for the email list? It seems you entered nothing at all. I am here for you, but you gotta give me something to work with.'

  validates_format_of       :email, :with => Authentication.email_regex, :message => 'The email address you entered looks suspiciously unlike an email address. Please make sure you typed it in right.'

  validates_uniqueness_of   :email, :message => 'The email address you entered is already on my list. Are you not getting the emails? If so, please email me so I can make sure this gets fixed.'

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation

  def login
    email
  end
  
  def self.authenticate(email, password)
    return nil if email.blank? || password.blank?
    u = find_in_state :first, :active, :conditions => {:email => email.downcase} # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  protected
    def make_activation_code
        self.deleted_at = nil
        self.activation_code = self.class.make_token
    end
end