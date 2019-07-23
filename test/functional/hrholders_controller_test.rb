require 'test_helper'

class HrholdersControllerTest < ActionController::TestCase
  setup do
    @hrholder = hrholders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hrholders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hrholder" do
    assert_difference('Hrholder.count') do
      post :create, :hrholder => @hrholder.attributes
    end

    assert_redirected_to hrholder_path(assigns(:hrholder))
  end

  test "should show hrholder" do
    get :show, :id => @hrholder.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @hrholder.to_param
    assert_response :success
  end

  test "should update hrholder" do
    put :update, :id => @hrholder.to_param, :hrholder => @hrholder.attributes
    assert_redirected_to hrholder_path(assigns(:hrholder))
  end

  test "should destroy hrholder" do
    assert_difference('Hrholder.count', -1) do
      delete :destroy, :id => @hrholder.to_param
    end

    assert_redirected_to hrholders_path
  end
end
