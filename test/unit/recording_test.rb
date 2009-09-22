require 'test_helper'

class RecordingTest < ActiveSupport::TestCase
  should_belong_to :song
  should_belong_to :recording_session  
end
