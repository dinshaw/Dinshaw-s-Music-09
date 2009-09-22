require 'test_helper'

class SongTest < ActiveSupport::TestCase
  should_have_many :recordings
  should_validate_presence_of :title  
end
