require 'ostruct'
require 'active_support/all'

module Lemonway
  class ResponseAdapter < OpenStruct
    def initialize(method, response)
      response = JSON.parse(response.body)['d'].deep_transform_keys { |key| key.underscore.to_sym }

      raise Errors::const_get("#{method}Error").new(response[:e]) if response[:e].present?

      super(response[:wallet] || response[:moneyinweb] || response[:trans] || response[:form])
    end
  end
end
