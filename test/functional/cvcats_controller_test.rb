require 'test_helper'

class CvcatsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Cvcat.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Cvcat.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Cvcat.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to cvcat_url(assigns(:cvcat))
  end
  
  def test_edit
    get :edit, :id => Cvcat.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Cvcat.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Cvcat.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Cvcat.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Cvcat.first
    assert_redirected_to cvcat_url(assigns(:cvcat))
  end
  
  def test_destroy
    cvcat = Cvcat.first
    delete :destroy, :id => cvcat
    assert_redirected_to cvcats_url
    assert !Cvcat.exists?(cvcat.id)
  end
end
