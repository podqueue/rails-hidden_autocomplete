module Rails
  module HiddenAutocomplete
    module ActionView
      module Helpers
        module DateTimeSelector
          private

          def build_hidden(type, value)
            select_options = {
              type: 'hidden',
              id: input_id_from_type(type),
              name: input_name_from_type(type),
              value: value,
              autocomplete: 'off'
            }.merge!(@html_options.slice(:disabled))
            select_options[:disabled] = 'disabled' if @options[:disabled]

            tag(:input, select_options) + "\n".html_safe
          end
        end
      end
    end
  end
end
