require 'test_helper'

class AddressHelperTest < ActionView::TestCase
  include AddressHelper
  context 'full address' do
    setup do
      @address = Address.make(
      :street => '123 Fake St', 
      :street_2 => "Apt #1", 
      :city => 'New York', 
      :state => 'NY',
      :zip => '10036'
      )
    end

    should 'format the address' do
      assert_equal full_address(@address), '123 Fake St, Apt #1, New York, NY 10036'
    end
  end
  
  context 'partial address' do
     setup do
       @address = Address.make(
       :street => '123 Fake St', 
       :street_2 => '',        
       :city => 'New York', 
       :state => 'NY',
       :zip => '10036'
       )
     end

     should 'format the address' do
       assert_equal full_address(@address), '123 Fake St, New York, NY 10036'
     end
   end
end