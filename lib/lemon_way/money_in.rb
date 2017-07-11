# frozen_string_literal: true

require 'lemon_way/errors/money_in'

module LemonWay
  class MoneyIn
    class << self
      def init(params = {})
        params[:wallet] = params.delete(:id)
        LemonWay.client.send_request('MoneyInWebInit', '1.3', params)
      end

      def validate(params = {})
        params[:transactionId] = params.delete(:id)
        LemonWay.client.send_request('MoneyInValidate', '1.0', params)
      end
    end
  end
end
