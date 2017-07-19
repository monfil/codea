require 'test_helper'

class MaratonControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get maraton_index_url
    assert_response :success
  end

end
