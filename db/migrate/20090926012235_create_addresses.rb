class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :street
      t.string :street_2      
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.references :addressable, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
