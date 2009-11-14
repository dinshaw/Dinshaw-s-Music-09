require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  context 'page headers' do
    setup do
    end
  end
  context 'get_announcments' do
    setup do
      Announcememt.make(:expires => Date.tomorrow)
    end
    
    should 'collect all un-expired announcements'
  end

end