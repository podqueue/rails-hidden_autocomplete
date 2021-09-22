module Rails
  module HiddenAutocomplete
    module ActionView
      module Helpers
        module Tags
          module CheckBox
            private
            def hidden_field_for_checkbox(options)
              @unchecked_value ? tag("input", options.slice("name", "disabled", "form").merge!("type" => "hidden", "value" => @unchecked_value, "autocomplete" => "off")) : "".html_safe
            end
          end
        end
      end
    end
  end
end
