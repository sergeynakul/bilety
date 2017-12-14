require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def setup
  	@user = users(:michael)
  	@order = @user.orders.build(name: @user.name, email: @user.email, 
  		                        from: "Kiev", to: "Odessa", date: "01.01.2017")
  end

  test "should be valid" do
  	assert @order.valid?
  end

  test "user id should be present" do
    @order.user_id = nil
    assert_not @order.valid?
  end
end
