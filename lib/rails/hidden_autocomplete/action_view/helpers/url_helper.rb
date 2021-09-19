module Rails
  module HiddenAutocomplete
    module ActionView
      module Helpers
        module UrlHelper
          mattr_accessor :button_to_generates_button_tag, default: false

          def button_to(name = nil, options = nil, html_options = nil, &block)
            if block
              html_options = options
              options = name
            end
            options      ||= {}
            html_options ||= {}
            html_options = html_options.stringify_keys

            url    = options.is_a?(String) ? options : url_for(options)
            remote = html_options.delete('remote')
            params = html_options.delete('params')

            method     = html_options.delete('method').to_s
            method_tag = %w[patch put delete].include?(method) ? method_tag(method) : ''.html_safe

            form_method  = method == 'get' ? 'get' : 'post'
            form_options = html_options.delete('form') || {}
            form_options[:class] ||= html_options.delete('form_class') || 'button_to'
            form_options[:method] = form_method
            form_options[:action] = url
            form_options[:'data-remote'] = true if remote

            request_token_tag = if form_method == 'post'
                                  request_method = method.empty? ? 'post' : method
                                  token_tag(nil, form_options: { action: url, method: request_method })
                                else
                                  ''
                                end

            html_options = convert_options_to_data_attributes(options, html_options)
            html_options['type'] = 'submit'

            button = if block || button_to_generates_button_tag
                       content_tag('button', name || url, html_options, &block)
                     else
                       html_options['value'] = name || url
                       tag('input', html_options)
                     end

            inner_tags = method_tag.safe_concat(button).safe_concat(request_token_tag)
            if params
              to_form_params(params).each do |param|
                inner_tags.safe_concat tag(:input, type: 'hidden', name: param[:name], value: param[:value],
                                                   autocomplete: 'off')
              end
            end
            content_tag('form', inner_tags, form_options)
          end

          private

          def token_tag(token = nil, form_options: {})
            if token != false && defined?(protect_against_forgery?) && protect_against_forgery?
              token ||= form_authenticity_token(form_options: form_options)
              tag(:input, type: 'hidden', name: request_forgery_protection_token.to_s, value: token, autocomplete: 'off')
            else
              ''
            end
          end

          def method_tag(method)
            tag('input', type: 'hidden', name: '_method', value: method.to_s, autocomplete: 'off')
          end
        end
      end
    end
  end
end
