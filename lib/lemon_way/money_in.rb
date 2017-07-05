# frozen_string_literal: true

require 'lemon_way/errors/money_in'

module LemonWay
  class MoneyIn
    class << self
      def money_in_web_init(params = {})
        LemonWay.client.send_request('MoneyInWebInit', '1.3', params)
      end

      def get_money_in_trans_details(params = {})
        LemonWay.client.send_request('GetMoneyInTransDetails', '1.8', params)
      end

      def validate(params = {})
        LemonWay.client.send_request('MoneyInValidate', '1.0', params)
      end
    end
  end
end
