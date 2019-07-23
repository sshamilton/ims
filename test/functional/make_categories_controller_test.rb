require 'test_helper'

class MakeCategoriesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => MakeCategory.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    MakeCategory.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    MakeCategory.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to make_has_category_url(assigns(:make_has_category))
  end
  
  def test_edit
    get :edit, :id => MakeCategory.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    MakeCategory.any_instance.stubs(:valid?).returns(false)
    put :update, :id => MakeCategory.first
    assert_template 'edit'
  end
  
  def test_update_valid
    MakeCategory.any_instance.stubs(:valid?).returns(true)
    put :update, :id => MakeCategory.first
    assert_redirected_to make_has_category_url(assigns(:make_has_category))
  end
  
  def test_destroy
    make_has_category = MakeCategory.first
    delete :destroy, :id => make_has_category
    assert_redirected_to make_has_categories_url
    assert !MakeCategory.exists?(make_has_category.id)
  end
end
