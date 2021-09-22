module Rails
  module HiddenAutocomplete
    module ActionView
      module Helpers
        module Tags
          module Base
            def select_content_tag(option_tags, options, html_options)
              html_options = html_options.stringify_keys
              add_default_name_and_id(html_options)

              if placeholder_required?(html_options)
                raise ArgumentError, "include_blank cannot be false for a required field." if options[:include_blank] == false
                options[:include_blank] ||= true unless options[:prompt]
              end

              value = options.fetch(:selected) { value() }
              select = content_tag("select", add_options(option_tags, options, value), html_options)

              if html_options["multiple"] && options.fetch(:include_hidden, true)
                tag("input", disabled: html_options["disabled"], name: html_options["name"], type: "hidden", value: "", autocomplete: "off") + select
              else
                select
              end
            end
          end
        end
      end
    end
  end
end
