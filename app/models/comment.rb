class Comment < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :commentable, :polymorphic => true
  
  validates_presence_of :name
  validates_presence_of :email
  validates_format_of :email, :with => VALID_EMAIL, :if => Proc.new{|comment| !comment.email.blank? }
  validates_presence_of :body
  validates_format_of :url, :with => VALID_URL, :if => Proc.new{|comment| !comment.url.blank? }, :message => "should look like 'http://something.something"

end
