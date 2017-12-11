require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @base_title = "ЖД билеты на украинские поезда"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "#{@base_title} | Регистрация"
  end

end
