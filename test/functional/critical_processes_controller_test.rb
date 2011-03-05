require 'test_helper'

class CriticalProcessesControllerTest < ActionController::TestCase
  setup do
    @critical_process = critical_processes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:critical_processes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create critical_process" do
    assert_difference('CriticalProcess.count') do
      post :create, :critical_process => @critical_process.attributes
    end

    assert_redirected_to critical_process_path(assigns(:critical_process))
  end

  test "should show critical_process" do
    get :show, :id => @critical_process.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @critical_process.to_param
    assert_response :success
  end

  test "should update critical_process" do
    put :update, :id => @critical_process.to_param, :critical_process => @critical_process.attributes
    assert_redirected_to critical_process_path(assigns(:critical_process))
  end

  test "should destroy critical_process" do
    assert_difference('CriticalProcess.count', -1) do
      delete :destroy, :id => @critical_process.to_param
    end

    assert_redirected_to critical_processes_path
  end
end
