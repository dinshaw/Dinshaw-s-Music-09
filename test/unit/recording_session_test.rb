require 'test_helper'

class RecordingSessionTest < ActiveSupport::TestCase
  should_have_many :recordings
  should_have_one :gig
end
