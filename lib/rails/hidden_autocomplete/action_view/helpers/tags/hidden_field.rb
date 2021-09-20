module Rails
  module HiddenAutocomplete
    module ActionView
      module Helpers
        module Tags
          module HiddenField
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
