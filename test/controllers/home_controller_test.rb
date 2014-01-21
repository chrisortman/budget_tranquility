require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    
    get(:index,nil,{'user_id' => users(:chris).id})
    assert_response :success
  end

  test "should get setup" do
    get :setup
    assert_response :success
  end

end
