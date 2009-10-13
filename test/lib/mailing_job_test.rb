require 'test_helper'
class MailingJobTest < ActiveSupport::TestCase
  context 'perform' do
    setup do
      @notification = Notification.make
      3.times do
        user = User.make
        user.activate!
      end
      2.times do
        user = User.make
        user.activate!
        user.update_attribute :last_notification, @notification.id
      end
      2.times do
        user = User.make
      end
    end
    should 'colect users' do
      assert_equal User.count, 7
      assert_equal User.active.count, 5
      assert_equal User.active.unnotified(@notification.id).count, 3
    end
  end
end
