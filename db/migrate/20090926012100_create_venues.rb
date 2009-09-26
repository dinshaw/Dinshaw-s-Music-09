class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.string :name
      t.string :location
      t.text :description
      t.text :directions
      t.timestamps
    end
  end

  def self.down
    drop_table :venues
  end
end
