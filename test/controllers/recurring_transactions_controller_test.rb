require 'test_helper'

class RecurringTransactionsControllerTest < ActionController::TestCase
  setup do
    @recurring_transaction = recurring_transactions(:chris_paycheck)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recurring_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recurring_transaction" do
    assert_difference('RecurringTransaction.count') do
      post :create, recurring_transaction: { amount: @recurring_transaction.amount, description: @recurring_transaction.description }
    end

    assert_redirected_to recurring_transaction_path(assigns(:recurring_transaction))
  end

  test "should show recurring_transaction" do
    get :show, id: @recurring_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recurring_transaction
    assert_response :success
  end

  test "should update recurring_transaction" do
    patch :update, id: @recurring_transaction, recurring_transaction: { amount: @recurring_transaction.amount, description: @recurring_transaction.description }
    assert_redirected_to recurring_transaction_path(assigns(:recurring_transaction))
  end

  test "should destroy recurring_transaction" do
    assert_difference('RecurringTransaction.count', -1) do
      delete :destroy, id: @recurring_transaction
    end

    assert_redirected_to recurring_transactions_path
  end
end
