require 'test_helper'

class EnvelopesControllerTest < ActionController::TestCase
  setup do
    @envelope = envelopes(:groceries)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:envelopes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create envelope" do
    assert_difference('Envelope.count') do
      post :create, envelope: { label: @envelope.label, per_check: @envelope.per_check, per_month: @envelope.per_month }
    end

    assert_redirected_to envelope_path(assigns(:envelope))
  end

  test "should show envelope" do
    get :show, id: @envelope
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @envelope
    assert_response :success
  end

  test "should update envelope" do
    patch :update, id: @envelope, envelope: { label: @envelope.label, per_check: @envelope.per_check, per_month: @envelope.per_month }
    assert_redirected_to envelope_path(assigns(:envelope))
  end

  test "should destroy envelope" do
    assert_difference('Envelope.count', -1) do
      delete :destroy, id: @envelope
    end

    assert_redirected_to envelopes_path
  end
end
