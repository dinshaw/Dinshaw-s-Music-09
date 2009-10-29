class Venue < ActiveRecord::Base
  has_one :address, :as => :addressable
  has_many :gigs
  validates_presence_of :url
end
