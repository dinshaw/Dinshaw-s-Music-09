class Song < ActiveRecord::Base
  has_many :recordings
  validates_presence_of :title
end
