require 'test_helper'

class VenueTest < ActiveSupport::TestCase
  should_have_many :gigs
  should_have_one :address
end
