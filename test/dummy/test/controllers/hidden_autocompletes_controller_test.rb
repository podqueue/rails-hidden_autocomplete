require 'test_helper'

class HiddenAutocompletesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hidden_autocompletes_index_url
    assert_response :success
  end

end
