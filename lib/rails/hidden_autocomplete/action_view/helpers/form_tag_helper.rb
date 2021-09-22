module Rails
  module HiddenAutocomplete
    module ActionView
      module Helpers
        module FormTagHelper
          def hidden_field_tag(name, value = nil, options = {})
            super(name, value, options.merge(autocomplete: 'off'))
          end

          def utf8_enforcer_tag
            '<input name="utf8" type="hidden" value="&#x2713;" autocomplete="off" />'.html_safe
          end
        end
      end
    end
  end
end
