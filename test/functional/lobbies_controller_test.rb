require 'test_helper'

class LobbiesControllerTest < ActionController::TestCase
  setup do
    @lobby = lobbies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lobbies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lobby" do
    assert_difference('Lobby.count') do
      post :create, :lobby => @lobby.attributes
    end

    assert_redirected_to lobby_path(assigns(:lobby))
  end

  test "should show lobby" do
    get :show, :id => @lobby.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @lobby.to_param
    assert_response :success
  end

  test "should update lobby" do
    put :update, :id => @lobby.to_param, :lobby => @lobby.attributes
    assert_redirected_to lobby_path(assigns(:lobby))
  end

  test "should destroy lobby" do
    assert_difference('Lobby.count', -1) do
      delete :destroy, :id => @lobby.to_param
    end

    assert_redirected_to lobbies_path
  end
end
