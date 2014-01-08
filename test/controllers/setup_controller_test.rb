require 'test_helper'

class SetupControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get paychecks" do
    get :paychecks
    assert_response :success
  end

  test "should get bills" do
    get :bills
    assert_response :success
  end

  test "should get envelopes" do
    get :envelopes
    assert_response :success
  end

end
