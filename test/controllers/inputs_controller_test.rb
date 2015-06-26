require 'test_helper'

class InputsControllerTest < ActionController::TestCase
  setup do
    @input = inputs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inputs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create input" do
    assert_difference('Input.count') do
      post :create, input: { input_type: @input.input_type, price: @input.price, product: @input.product, quantity: @input.quantity, supplier: @input.supplier, units: @input.units, user_id: @input.user_id, year: @input.year }
    end

    assert_redirected_to input_path(assigns(:input))
  end

  test "should show input" do
    get :show, id: @input
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @input
    assert_response :success
  end

  test "should update input" do
    patch :update, id: @input, input: { input_type: @input.input_type, price: @input.price, product: @input.product, quantity: @input.quantity, supplier: @input.supplier, units: @input.units, user_id: @input.user_id, year: @input.year }
    assert_redirected_to input_path(assigns(:input))
  end

  test "should destroy input" do
    assert_difference('Input.count', -1) do
      delete :destroy, id: @input
    end

    assert_redirected_to inputs_path
  end
end
