class Recording < ActiveRecord::Base
  belongs_to :song
  belongs_to :recording_session
  has_attached_file :track
  # validates_attachment_content_type :track, :content_type => [ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3' ]  
end
