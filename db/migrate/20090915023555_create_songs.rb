class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.string :title
      t.text :lyrics
      t.text :notes
      t.date :composition_date
      t.string :composition_location
      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
