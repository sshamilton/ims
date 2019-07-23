require 'test_helper'

class HandReceiptsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => HandReceipt.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    HandReceipt.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    HandReceipt.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to hand_receipt_url(assigns(:hand_receipt))
  end
  
  def test_edit
    get :edit, :id => HandReceipt.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    HandReceipt.any_instance.stubs(:valid?).returns(false)
    put :update, :id => HandReceipt.first
    assert_template 'edit'
  end
  
  def test_update_valid
    HandReceipt.any_instance.stubs(:valid?).returns(true)
    put :update, :id => HandReceipt.first
    assert_redirected_to hand_receipt_url(assigns(:hand_receipt))
  end
  
  def test_destroy
    hand_receipt = HandReceipt.first
    delete :destroy, :id => hand_receipt
    assert_redirected_to hand_receipts_url
    assert !HandReceipt.exists?(hand_receipt.id)
  end
end
