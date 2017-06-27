require 'ostruct'
require 'active_support/all'
require 'lemonway/errors/response_adapter'

module Lemonway
  class ResponseAdapter < OpenStruct
    def initialize(response)
      response = JSON.parse(response.body)['d']

      raise Errors::ResponseError.new(response['E']) unless response['E'].nil?

      super(response['WALLET'].deep_transform_keys { |key| key.underscore.to_sym })
    end
  end
end
