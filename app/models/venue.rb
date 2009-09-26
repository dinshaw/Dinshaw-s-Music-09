class Venue < ActiveRecord::Base
  has_one :address, :as => :addressable
  has_many :gigs
end
