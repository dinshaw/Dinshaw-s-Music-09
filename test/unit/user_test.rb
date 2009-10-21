require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should_not_allow_mass_assignment_of :crypted_password
  should_not_allow_values_for :email, "blah", "b lah"
  should_allow_values_for :email, "a@b.com", "asdf@asdf.com"

  context 'named_scopes' do
    setup do
      User.make(:last_notification => 1, :aasm_state => 'active')
      2.times { User.make(:last_notification => 2, :aasm_state => 'active')}
      3.times { User.make(:last_notification => 3, :aasm_state => 'active')}
      4.times { User.make(:aasm_state => 'active') }
    end
    
    should 'return the active users' do
      assert_equal User.active.count, 10
    end

    should 'return unnotifed users' do
      assert_equal User.unnotified(5).count, 10
      assert_equal User.unnotified(1).count, 9
      assert_equal User.unnotified(2).count, 8
      assert_equal User.unnotified(3).count, 7
    end
  end
  context 'notify!' do
    setup do
      @user = User.make
    end
    
    should 'set the last_notification id' do   
      @user.notify!(2)
      assert_equal @user.last_notification, 2
    end
  end
end
