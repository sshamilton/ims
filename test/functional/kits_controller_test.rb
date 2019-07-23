require 'test_helper'

class KitsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Kit.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Kit.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Kit.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to kit_url(assigns(:kit))
  end
  
  def test_edit
    get :edit, :id => Kit.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Kit.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Kit.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Kit.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Kit.first
    assert_redirected_to kit_url(assigns(:kit))
  end
  
  def test_destroy
    kit = Kit.first
    delete :destroy, :id => kit
    assert_redirected_to kits_url
    assert !Kit.exists?(kit.id)
  end
end
