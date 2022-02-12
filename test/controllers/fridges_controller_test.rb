require 'test_helper'

class FridgesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fridges_index_url
    assert_response :success
  end

end
