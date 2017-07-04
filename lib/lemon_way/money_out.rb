require 'lemon_way/errors/money_out'

module LemonWay
  class MoneyOut
    class << self
      def register_iban(params = {})
        LemonWay.client.send_request('RegisterIBAN', '1.1', params)
      end

      def transfer(params = {})
        LemonWay.client.send_request('MoneyOut', '1.3', params)
      end

      def transfer_details(params = {})
        LemonWay.client.send_request('GetMoneyOutTransDetails', '1.4', params)
      end
    end
  end
end
