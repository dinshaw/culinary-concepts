require File.dirname(__FILE__) + '/../test_helper'

class PressesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:presses)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_press
    assert_difference('Press.count') do
      post :create, :press => { }
    end

    assert_redirected_to press_path(assigns(:press))
  end

  def test_should_show_press
    get :show, :id => presses(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => presses(:one).id
    assert_response :success
  end

  def test_should_update_press
    put :update, :id => presses(:one).id, :press => { }
    assert_redirected_to press_path(assigns(:press))
  end

  def test_should_destroy_press
    assert_difference('Press.count', -1) do
      delete :destroy, :id => presses(:one).id
    end

    assert_redirected_to presses_path
  end
end
