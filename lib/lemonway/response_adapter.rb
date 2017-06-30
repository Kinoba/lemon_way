require 'ostruct'
require 'active_support/all'

module Lemonway
  class ResponseAdapter < OpenStruct
    def initialize(method, response)
      response = JSON.parse(response.body)['d'].deep_transform_keys { |key| key.underscore.to_sym }

      raise Errors::const_get("#{method}Error").new(response[:e]) if response[:e].present?

      super(values_for(response))
    end

    private

    def values_for(response)
      response.detect { |k, _v| k.in?(response_keys) }.last
    end

    def response_keys
      %i(wallet moneyinweb trans form iban_register)
    end
  end
end
