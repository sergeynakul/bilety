require 'test_helper'

class LinkTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:michael)
  end
  
  test "links" do
  	log_in_as(@user)
  	get root_path
  	assert_template 'orders/new'
  end
end
