class AddBitlyToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :bitly, :string
  end

  def self.down
    remove_column :songs, :bitly
  end
end
