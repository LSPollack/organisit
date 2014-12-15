require 'test_helper'

class CoursesessionsControllerTest < ActionController::TestCase
  setup do
    @coursesession = coursesessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coursesessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coursesession" do
    assert_difference('Coursesession.count') do
      post :create, coursesession: { timeofday: @coursesession.timeofday }
    end

    assert_redirected_to coursesession_path(assigns(:coursesession))
  end

  test "should show coursesession" do
    get :show, id: @coursesession
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coursesession
    assert_response :success
  end

  test "should update coursesession" do
    patch :update, id: @coursesession, coursesession: { timeofday: @coursesession.timeofday }
    assert_redirected_to coursesession_path(assigns(:coursesession))
  end

  test "should destroy coursesession" do
    assert_difference('Coursesession.count', -1) do
      delete :destroy, id: @coursesession
    end

    assert_redirected_to coursesessions_path
  end
end
