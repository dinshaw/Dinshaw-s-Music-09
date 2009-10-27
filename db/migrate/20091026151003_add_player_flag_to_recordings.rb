class AddPlayerFlagToRecordings < ActiveRecord::Migration
  def self.up
    add_column :recordings, :in_player_rotation, :boolean
  end

  def self.down
    remove_column :recordings, :in_player_rotation
  end
end
