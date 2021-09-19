Rails.application.reloader.to_prepare do
  ActionView::Helpers::DateTimeSelector.prepend Rails::HiddenAutocomplete::ActionView::Helpers::DateTimeSelector
  ActionView::Helpers::FormTagHelper.prepend Rails::HiddenAutocomplete::ActionView::Helpers::FormTagHelper
  ActionView::Helpers::Tags.prepend Rails::HiddenAutocomplete::ActionView::Helpers::Tags
  ActionView::Helpers::UrlHelper.prepend Rails::HiddenAutocomplete::ActionView::Helpers::UrlHelper
end
