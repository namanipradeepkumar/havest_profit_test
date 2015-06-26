require 'test_helper'

class ContractsControllerTest < ActionController::TestCase
  setup do
    @contract = contracts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contracts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contract" do
    assert_difference('Contract.count') do
      post :create, contract: { basis: @contract.basis, bushels: @contract.bushels, contract_number: @contract.contract_number, contracts: @contract.contracts, delivery_location: @contract.delivery_location, delivery_period: @contract.delivery_period, futures_month: @contract.futures_month, futures_price: @contract.futures_price, gain_loss: @contract.gain_loss, long_short: @contract.long_short, open_order: @contract.open_order, sale_type: @contract.sale_type, strike_price: @contract.strike_price, user_id: @contract.user_id, year: @contract.year }
    end

    assert_redirected_to contract_path(assigns(:contract))
  end

  test "should show contract" do
    get :show, id: @contract
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contract
    assert_response :success
  end

  test "should update contract" do
    patch :update, id: @contract, contract: { basis: @contract.basis, bushels: @contract.bushels, contract_number: @contract.contract_number, contracts: @contract.contracts, delivery_location: @contract.delivery_location, delivery_period: @contract.delivery_period, futures_month: @contract.futures_month, futures_price: @contract.futures_price, gain_loss: @contract.gain_loss, long_short: @contract.long_short, open_order: @contract.open_order, sale_type: @contract.sale_type, strike_price: @contract.strike_price, user_id: @contract.user_id, year: @contract.year }
    assert_redirected_to contract_path(assigns(:contract))
  end

  test "should destroy contract" do
    assert_difference('Contract.count', -1) do
      delete :destroy, id: @contract
    end

    assert_redirected_to contracts_path
  end
end
