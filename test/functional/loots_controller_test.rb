require 'test_helper'

class LootsControllerTest < ActionController::TestCase
  setup do
    @loot = loots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loot" do
    assert_difference('Loot.count') do
      post :create, :loot => @loot.attributes
    end

    assert_redirected_to loot_path(assigns(:loot))
  end

  test "should show loot" do
    get :show, :id => @loot.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @loot.to_param
    assert_response :success
  end

  test "should update loot" do
    put :update, :id => @loot.to_param, :loot => @loot.attributes
    assert_redirected_to loot_path(assigns(:loot))
  end

  test "should destroy loot" do
    assert_difference('Loot.count', -1) do
      delete :destroy, :id => @loot.to_param
    end

    assert_redirected_to loots_path
  end
end
