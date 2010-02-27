class AddPoemToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :poem, :boolean
  end

  def self.down
    remove_column :songs, :poem
  end
end
