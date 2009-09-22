class CreateRecordings < ActiveRecord::Migration
  def self.up
    create_table :recordings do |t|
      t.text :notes
      t.references :song
      t.references :recording_session

      t.string :track_file_name
      t.string :track_content_type
      t.integer :track_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :recordings
  end
end
