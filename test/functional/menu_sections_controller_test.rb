require File.dirname(__FILE__) + '/../test_helper'

class MenuSectionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:menu_sections)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_menu_section
    assert_difference('MenuSection.count') do
      post :create, :menu_section => { }
    end

    assert_redirected_to menu_section_path(assigns(:menu_section))
  end

  def test_should_show_menu_section
    get :show, :id => menu_sections(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => menu_sections(:one).id
    assert_response :success
  end

  def test_should_update_menu_section
    put :update, :id => menu_sections(:one).id, :menu_section => { }
    assert_redirected_to menu_section_path(assigns(:menu_section))
  end

  def test_should_destroy_menu_section
    assert_difference('MenuSection.count', -1) do
      delete :destroy, :id => menu_sections(:one).id
    end

    assert_redirected_to menu_sections_path
  end
end
