class Song < ActiveRecord::Base
  has_many :recordings
  validates_presence_of :title
  validates_presence_of :lyrics
  validates_presence_of :composition_date
  validates_presence_of :composition_location
  
  default_scope :order => :title
end
