class EnhanceNotification < ActiveRecord::Migration
  def self.up
    add_column :notifications, :delivered_at, :datetime
    add_column :users, :last_notification, :integer    
  end

  def self.down
    remove_column :notifications, :delivered_at
    remove_column :users, :last_notification
  end
end
