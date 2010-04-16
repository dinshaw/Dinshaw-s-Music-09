class AddNoteworthyToNotifications < ActiveRecord::Migration
  def self.up
    add_column :notifications, :noteworthy_type, :string
    add_column :notifications, :noteworthy_id, :integer
  end

  def self.down
    remove_column :notifications, :noteworthy_type    
    remove_column :notifications, :noteworthy_id    
  end
end
