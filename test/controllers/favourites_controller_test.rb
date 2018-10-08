require 'test_helper'

class FavouritesControllerTest < ActionDispatch::IntegrationTest
  test "should get potential_buyers" do
    get favourites_potential_buyers_url
    assert_response :success
  end

end
