class CreateAnnouncements < ActiveRecord::Migration
  def self.up
    create_table :announcements do |t|
      t.string :title
      t.body :text
      t.datetime :expiration

      t.timestamps
    end
  end

  def self.down
    drop_table :announcements
  end
end
