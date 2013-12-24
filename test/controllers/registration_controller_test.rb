require 'test_helper'

class RegistrationControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should require input to create" do
  	post :create
  	assert_redirected_to register_url, 'Did not redirect to correct url'
  	assert_equal flash[:notice],  'Missing required information','No message in flash'
  end

  test "#create should create new user" do
    assert_difference('User.count') do
      post :create, :email => 'chrisortman@gmail.com', :new_password => 'welcome', :new_password_confirmation => 'welcome'
    end
  end
end
