class AddRecordingSessionToGig < ActiveRecord::Migration
  def self.up
    add_column :gigs, :recording_session_id, :integer
  end

  def self.down
    remove_column :gigs, :recording_session_id
  end
end
