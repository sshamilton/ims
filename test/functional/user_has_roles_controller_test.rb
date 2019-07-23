require 'test_helper'

class UserHasRolesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => UserHasRole.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    UserHasRole.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    UserHasRole.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to user_has_role_url(assigns(:user_has_role))
  end
  
  def test_edit
    get :edit, :id => UserHasRole.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    UserHasRole.any_instance.stubs(:valid?).returns(false)
    put :update, :id => UserHasRole.first
    assert_template 'edit'
  end
  
  def test_update_valid
    UserHasRole.any_instance.stubs(:valid?).returns(true)
    put :update, :id => UserHasRole.first
    assert_redirected_to user_has_role_url(assigns(:user_has_role))
  end
  
  def test_destroy
    user_has_role = UserHasRole.first
    delete :destroy, :id => user_has_role
    assert_redirected_to user_has_roles_url
    assert !UserHasRole.exists?(user_has_role.id)
  end
end
