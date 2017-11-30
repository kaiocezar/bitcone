require 'test_helper'

class ConesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cone = cones(:one)
  end

  test "should get index" do
    get cones_url
    assert_response :success
  end

  test "should get new" do
    get new_cone_url
    assert_response :success
  end

  test "should create cone" do
    assert_difference('Cone.count') do
      post cones_url, params: { cone: { price: @cone.price, status: @cone.status } }
    end

    assert_redirected_to cone_url(Cone.last)
  end

  test "should show cone" do
    get cone_url(@cone)
    assert_response :success
  end

  test "should get edit" do
    get edit_cone_url(@cone)
    assert_response :success
  end

  test "should update cone" do
    patch cone_url(@cone), params: { cone: { price: @cone.price, status: @cone.status } }
    assert_redirected_to cone_url(@cone)
  end

  test "should destroy cone" do
    assert_difference('Cone.count', -1) do
      delete cone_url(@cone)
    end

    assert_redirected_to cones_url
  end
end
