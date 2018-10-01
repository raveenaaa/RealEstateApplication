require 'test_helper'

class HouseHuntersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @house_hunter = house_hunters(:one)
  end

  test "should get index" do
    get house_hunters_url
    assert_response :success
  end

  test "should get new" do
    get new_house_hunter_url
    assert_response :success
  end

  test "should create house_hunter" do
    assert_difference('HouseHunter.count') do
      post house_hunters_url, params: { house_hunter: { email: @house_hunter.email, name: @house_hunter.name, password: @house_hunter.password, phone: @house_hunter.phone } }
    end

    assert_redirected_to house_hunter_url(HouseHunter.last)
  end

  test "should show house_hunter" do
    get house_hunter_url(@house_hunter)
    assert_response :success
  end

  test "should get edit" do
    get edit_house_hunter_url(@house_hunter)
    assert_response :success
  end

  test "should update house_hunter" do
    patch house_hunter_url(@house_hunter), params: { house_hunter: { email: @house_hunter.email, name: @house_hunter.name, password: @house_hunter.password, phone: @house_hunter.phone } }
    assert_redirected_to house_hunter_url(@house_hunter)
  end

  test "should destroy house_hunter" do
    assert_difference('HouseHunter.count', -1) do
      delete house_hunter_url(@house_hunter)
    end

    assert_redirected_to house_hunters_url
  end
end
