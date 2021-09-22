ActiveSupport.on_load(:action_view) do
  ActionView::Helpers::DateTimeSelector.prepend Rails::HiddenAutocomplete::ActionView::Helpers::DateTimeSelector
  ActionView::Helpers::FormTagHelper.prepend Rails::HiddenAutocomplete::ActionView::Helpers::FormTagHelper
  ActionView::Helpers::Tags::Base.prepend Rails::HiddenAutocomplete::ActionView::Helpers::Tags::Base
  ActionView::Helpers::Tags::CheckBox.prepend Rails::HiddenAutocomplete::ActionView::Helpers::Tags::CheckBox
  ActionView::Helpers::Tags::HiddenField.prepend Rails::HiddenAutocomplete::ActionView::Helpers::Tags::HiddenField
  ActionView::Helpers::UrlHelper.prepend Rails::HiddenAutocomplete::ActionView::Helpers::UrlHelper
end
