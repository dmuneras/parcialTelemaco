require 'test_helper'

class WorkersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Worker.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Worker.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Worker.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to worker_url(assigns(:worker))
  end

  def test_edit
    get :edit, :id => Worker.first
    assert_template 'edit'
  end

  def test_update_invalid
    Worker.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Worker.first
    assert_template 'edit'
  end

  def test_update_valid
    Worker.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Worker.first
    assert_redirected_to worker_url(assigns(:worker))
  end

  def test_destroy
    worker = Worker.first
    delete :destroy, :id => worker
    assert_redirected_to workers_url
    assert !Worker.exists?(worker.id)
  end
end
