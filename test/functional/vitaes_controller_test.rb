require 'test_helper'

class VitaesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Vitae.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Vitae.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Vitae.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to vitae_url(assigns(:vitae))
  end
  
  def test_edit
    get :edit, :id => Vitae.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Vitae.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Vitae.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Vitae.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Vitae.first
    assert_redirected_to vitae_url(assigns(:vitae))
  end
  
  def test_destroy
    vitae = Vitae.first
    delete :destroy, :id => vitae
    assert_redirected_to vitaes_url
    assert !Vitae.exists?(vitae.id)
  end
end
