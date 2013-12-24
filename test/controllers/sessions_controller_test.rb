require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should be able to log in" do
    post :create,  {email:@user.email, password:'welcome'}
    assert_response :success
    assert_equal @user.id, session[:user_id]
  end

  test "Bad login should redirect" do
    post :create, {email:@user.email, password:'not it'}
    assert_redirected_to action: 'new'
  end
end
