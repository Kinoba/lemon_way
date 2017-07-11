# frozen_string_literal: true

require 'ostruct'
require 'active_support/all'

module LemonWay
  class ResponseAdapter < OpenStruct
    def initialize(response)
      response = JSON.parse(response.body)['d'].deep_transform_keys { |key| key.underscore.to_sym }

      raise LemonWay::LemonWayError.new(response[:e]) if response[:e].present?

      super(values_for(response))
    end

    private

    def values_for(response)
      response.detect { |k, _v| k.in?(response_keys) }.last
    end

    def response_keys
      %i[wallet moneyinweb trans form iban_register]
    end
  end
end
