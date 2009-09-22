class CreateRecordingSessions < ActiveRecord::Migration
  def self.up
    create_table :recording_sessions do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :recording_sessions
  end
end
