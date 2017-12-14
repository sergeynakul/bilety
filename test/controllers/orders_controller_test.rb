require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
    @admin = users(:michael)
    @base_title = "ЖД билеты на украинские поезда"
  end

  test "should get index" do
    log_in_as(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
    assert_select "title", "#{@base_title} | Все запросы"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "#{@base_title} | Запрос цены"
  end

 

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end



  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
