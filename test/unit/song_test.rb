require 'test_helper'

class SongTest < ActiveSupport::TestCase
  should_have_many :recordings
  should_validate_presence_of :title  
  
  context 'create' do
    setup do
      @bitly_url = stub(:short_url => 'http://bit.ly/asdf')
      @bitly = stub(:shorten => @bitly_url)      
      Bitly.expects(:new).returns(@bitly)
    end
    should 'create a bitly url' do
      assert_equal Song.make.bitly, 'http://bit.ly/asdf'
    end
  end
  
end
