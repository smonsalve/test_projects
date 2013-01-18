require 'test_helper'

class FrasesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Frase.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Frase.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Frase.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to frase_url(assigns(:frase))
  end

  def test_edit
    get :edit, :id => Frase.first
    assert_template 'edit'
  end

  def test_update_invalid
    Frase.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Frase.first
    assert_template 'edit'
  end

  def test_update_valid
    Frase.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Frase.first
    assert_redirected_to frase_url(assigns(:frase))
  end

  def test_destroy
    frase = Frase.first
    delete :destroy, :id => frase
    assert_redirected_to frases_url
    assert !Frase.exists?(frase.id)
  end
end
