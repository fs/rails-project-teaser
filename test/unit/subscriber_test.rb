require 'test_helper'

class SubscriberTest < Test::Unit::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end



  def test_invalid_with_empty_attribute
      subscriber = Subscriber.new
      assert !subscriber.valid?
      assert subscriber.errors.invalid?(:email)
      assert subscriber.errors.invalid?(:user_agent)
      assert subscriber.errors.invalid?(:referrer)
      assert subscriber.errors.invalid?(:ip)
      assert subscriber.errors.invalid?(:email)
  end

end
