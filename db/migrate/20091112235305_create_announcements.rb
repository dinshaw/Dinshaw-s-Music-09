class CreateAnnouncements < ActiveRecord::Migration
  def self.up
    create_table :announcements do |t|
      t.string :title
      t.text :body
      t.datetime :expiration
      t.boolean :expires
      t.timestamps
    end
  end

  def self.down
    drop_table :announcements
  end
end
