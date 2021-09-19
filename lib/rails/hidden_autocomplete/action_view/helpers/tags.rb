module Rails
  module HiddenAutocomplete
    module ActionView
      module Helpers
        module Tags
          class HiddenField
            def render
              @options[:autocomplete] = 'off'
              super
            end
          end
        end
      end
    end
  end
end
