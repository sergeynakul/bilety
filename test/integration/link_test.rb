require 'test_helper'

class LinkTest < ActionDispatch::IntegrationTest
  
  test "links" do
  	get root_path
  	assert_template 'orders/new'
  	assert_select "a[href=?]", singup_path
  	# assert_select "a[href=?]", login_path
  end
end
