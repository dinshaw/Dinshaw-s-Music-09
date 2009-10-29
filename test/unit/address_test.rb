require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  context 'city_state' do
    setup do
      @address = Address.make(:city => 'New York', :state => 'NY')
    end
    should 'return only the city andstate' do
      assert_equal @address.city_state, "New York, NY"
    end
  end
end
