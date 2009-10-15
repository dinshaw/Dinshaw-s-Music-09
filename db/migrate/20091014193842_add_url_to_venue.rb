class AddUrlToVenue < ActiveRecord::Migration
  def self.up
    add_column :venue, :url, :string
  end

  def self.down
    remove_column :venue, :url
  end
end
