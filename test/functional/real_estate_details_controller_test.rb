require 'test_helper'

class RealEstateDetailsControllerTest < ActionController::TestCase
  setup do
    @real_estate_detail = real_estate_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:real_estate_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create real_estate_detail" do
    assert_difference('RealEstateDetail.count') do
      post :create, real_estate_detail: @real_estate_detail.attributes
    end

    assert_redirected_to real_estate_detail_path(assigns(:real_estate_detail))
  end

  test "should show real_estate_detail" do
    get :show, id: @real_estate_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @real_estate_detail
    assert_response :success
  end

  test "should update real_estate_detail" do
    put :update, id: @real_estate_detail, real_estate_detail: @real_estate_detail.attributes
    assert_redirected_to real_estate_detail_path(assigns(:real_estate_detail))
  end

  test "should destroy real_estate_detail" do
    assert_difference('RealEstateDetail.count', -1) do
      delete :destroy, id: @real_estate_detail
    end

    assert_redirected_to real_estate_details_path
  end
end
