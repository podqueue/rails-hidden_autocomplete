require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  include Rails::HiddenAutocomplete::Engine.routes.url_helpers

  setup do
    @routes = Rails::HiddenAutocomplete::Engine.routes
  end

  test "view in dummy app should have all hidden tags generated with autocomplete=\"off\"" do
    get root_url
    assert_response :success
    assert_select 'input#hidden_field_tag_test[type="hidden"][autocomplete="off"]'
    assert_select '#button_to_test > input[type="hidden"][name="authenticity_token"][autocomplete="off"]'
    (1..3).each do |i|
      assert_select "input#article_written_on_#{i}i[type=\"hidden\"][autocomplete=\"off\"]"
    end
		assert_select '#form_with_test > input[type="hidden"][name="authenticity_token"][autocomplete="off"]'
    assert_select '#form_with_test > input[type="hidden"][name="hidden_field_test"][autocomplete="off"]'
  end
end
