require 'test_helper'

class SavedRealEstatesControllerTest < ActionController::TestCase
  setup do
    @saved_real_estate = saved_real_estates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:saved_real_estates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create saved_real_estate" do
    assert_difference('SavedRealEstate.count') do
      post :create, saved_real_estate: {  }
    end

    assert_redirected_to saved_real_estate_path(assigns(:saved_real_estate))
  end

  test "should show saved_real_estate" do
    get :show, id: @saved_real_estate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @saved_real_estate
    assert_response :success
  end

  test "should update saved_real_estate" do
    put :update, id: @saved_real_estate, saved_real_estate: {  }
    assert_redirected_to saved_real_estate_path(assigns(:saved_real_estate))
  end

  test "should destroy saved_real_estate" do
    assert_difference('SavedRealEstate.count', -1) do
      delete :destroy, id: @saved_real_estate
    end

    assert_redirected_to saved_real_estates_path
  end
end
