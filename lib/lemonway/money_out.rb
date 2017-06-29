require 'lemonway/errors/money_out'

module Lemonway
  class MoneyOut
    class << self
      def register_iban(params = {})
        Lemonway.client.send_request('RegisterIBAN', '1.1', params)
      end

      def transfer(params = {})
        Lemonway.client.send_request('MoneyOut', '1.3', params)
      end

      def transfer_details(params = {})
        Lemonway.client.send_request('GetMoneyOutTransDetails', '1.4', params)
      end
    end
  end
end
