require 'test_helper'

class ItemClassesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => ItemClass.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    ItemClass.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    ItemClass.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to item_class_url(assigns(:item_class))
  end
  
  def test_edit
    get :edit, :id => ItemClass.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    ItemClass.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ItemClass.first
    assert_template 'edit'
  end
  
  def test_update_valid
    ItemClass.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ItemClass.first
    assert_redirected_to item_class_url(assigns(:item_class))
  end
  
  def test_destroy
    item_class = ItemClass.first
    delete :destroy, :id => item_class
    assert_redirected_to item_classes_url
    assert !ItemClass.exists?(item_class.id)
  end
end
