class AddKindToNotifications < ActiveRecord::Migration
  def self.up
    add_column :notifications, :kind, :string
  end

  def self.down
    remove_column :notifications, :kind
  end
end
