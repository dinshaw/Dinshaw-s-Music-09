class RecordingSession < ActiveRecord::Base
  has_many :recordings
  has_one :gig
  validates_presence_of :title
  validates_presence_of :start_date
  validates_presence_of :description
end
