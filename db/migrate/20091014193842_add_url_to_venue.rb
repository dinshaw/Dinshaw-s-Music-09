class AddUrlToVenue < ActiveRecord::Migration
  def self.up
    add_column :venues, :url, :string
  end

  def self.down
    remove_column :venues, :url
  end
end
