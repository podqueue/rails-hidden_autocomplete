module Rails
  module HiddenAutocomplete
    module ActionView
      module Helpers
        module FormTagHelper
          def hidden_field_tag(name, value = nil, options = {})
            super(name, value, options.merge(autocomplete: 'off'))
          end
        end
      end
    end
  end
end
