class CreateGigs < ActiveRecord::Migration
  def self.up
    create_table :gigs do |t|
      t.references :venue
      t.datetime :time_start
      t.datetime :time_end
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :gigs
  end
end
