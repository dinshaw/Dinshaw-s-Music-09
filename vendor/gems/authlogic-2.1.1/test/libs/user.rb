class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_authorization_object
  belongs_to :company
  has_and_belongs_to_many :projects
end