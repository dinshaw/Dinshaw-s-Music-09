class CreateNotifications < ActiveRecord::Migration
  def self.up
    create_table :notifications do |t|
      t.text :body
      t.text :title
      t.timestamps
    end
  end

  def self.down
    drop_table :notifications
  end
end
