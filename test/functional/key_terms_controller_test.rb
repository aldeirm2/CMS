require 'test_helper'

class KeyTermsControllerTest < ActionController::TestCase
  setup do
    @key_term = key_terms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:key_terms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create key_term" do
    assert_difference('KeyTerm.count') do
      post :create, :key_term => @key_term.attributes
    end

    assert_redirected_to key_term_path(assigns(:key_term))
  end

  test "should show key_term" do
    get :show, :id => @key_term.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @key_term.to_param
    assert_response :success
  end

  test "should update key_term" do
    put :update, :id => @key_term.to_param, :key_term => @key_term.attributes
    assert_redirected_to key_term_path(assigns(:key_term))
  end

  test "should destroy key_term" do
    assert_difference('KeyTerm.count', -1) do
      delete :destroy, :id => @key_term.to_param
    end

    assert_redirected_to key_terms_path
  end
end
