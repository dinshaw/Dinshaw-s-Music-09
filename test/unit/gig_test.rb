require 'test_helper'

class GigTest < ActiveSupport::TestCase
  context 'when valid' do
    should_belong_to :venue
    should_belong_to :recording_session

    setup do
      @time_now = Time.parse("Feb 24 1981")
      Time.stubs(:now).and_return(@time_now)
    end

    should_have_named_scope :upcoming, :conditions => ["time_start > ?", 1.day.ago]
  end
end
