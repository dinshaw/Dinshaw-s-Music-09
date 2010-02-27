class AddPublicFlagToRecordings < ActiveRecord::Migration
  def self.up
    add_column :recordings, :public, :boolean
  end

  def self.down
    remove_column :recordings, :public
  end
end
