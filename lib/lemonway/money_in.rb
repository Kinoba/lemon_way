require 'lemonway/errors/money_in'

module Lemonway
  class MoneyIn
    class << self
      def money_in_web_init(params = {})
        Lemonway.client.send_request('MoneyInWebInit', '1.3', params)
      end

      def get_money_in_trans_details(params = {})
        Lemonway.client.send_request('GetMoneyInTransDetails', '1.8', params)
      end

      def validate(params = {})
        Lemonway.client.send_request('MoneyInValidate', '1.0', params)
      end
    end
  end
end
