class Gig < ActiveRecord::Base
  belongs_to :venue
  belongs_to :recording_session
  default_scope :order => "time_start asc"
  named_scope :upcoming, :conditions => ["time_start > ?", 1.day.ago]
end
