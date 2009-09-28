class Song < ActiveRecord::Base
  has_many :recordings
  validates_presence_of :title, :lyrics, :composition_date, :composition_location
end
