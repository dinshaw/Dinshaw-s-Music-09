class Recording < ActiveRecord::Base
  belongs_to :song
  belongs_to :recording_session
  has_attached_file :track  
end
