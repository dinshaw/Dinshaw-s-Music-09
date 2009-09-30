require 'test_helper'

class GigTest < ActiveSupport::TestCase
  should_belong_to :venue
  should_belong_to :recording_session
end
