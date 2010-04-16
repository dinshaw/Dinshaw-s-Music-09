class Gig < ActiveRecord::Base
  belongs_to :venue
  belongs_to :recording_session
  has_many :notifications, :as => :noteworthy
  default_scope :order => "time_start asc"
  named_scope :upcoming, :conditions => ["time_start > ?", 1.day.ago]
  
  def upcoming?
    time_start > Date.today.end_of_day
  end
  
  def subject
    ['Live at',venue.name+':', time_start.to_s(:gig),'to',time_end.to_s(:time_end)].join(" ")
  end
end
