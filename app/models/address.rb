class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
  
  validates_presence_of :city
  validates_presence_of :state
  
  def city_state
    [city,state].join(", ")
  end
end