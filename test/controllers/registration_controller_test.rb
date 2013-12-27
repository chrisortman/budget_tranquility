require 'test_helper'

class RegistrationControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should require input to create" do
  	post :create, user:{email: '', new_password:'', new_password_confirmation:''}
    assert_template :new
  end

  test "#create should create new user" do
    assert_difference('User.count') do
      post :create, user: {email: 'chrisortman@gmail.com',
                           new_password: 'welcome',
                           new_password_confirmation: 'welcome'}
    end

    assert User.authenticate('chrisortman@gmail.com','welcome')
  end
end
