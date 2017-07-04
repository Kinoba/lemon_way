# frozen_string_literal: true

require 'lemon_way/error'

module LemonWay
  module Errors
    class RegisterIBANError < LemonWayError
      def initialize(error)
        super(%(
        Documentation: http://documentation.lemonway.fr/api-en/directkit/money-out-debit-a-wallet-and-credit-a-bank-account/registeriban-link-an-iban-to-a-wallet
        ), error)
      end
    end

    class MoneyOutError < LemonWayError
      def initialize(error)
        super(%(
        Documentation: http://documentation.lemonway.fr/api-en/directkit/money-out-debit-a-wallet-and-credit-a-bank-account/moneyout-external-fund-transfer-from-a-wallet-to-a-bank-account
        ), error)
      end
    end

    class GetMoneyOutTransDetailsError < LemonWayError
      def initialize(error)
        super(%(
        Documentation: http://documentation.lemonway.fr/api-en/directkit/money-out-debit-a-wallet-and-credit-a-bank-account/getmoneyouttransdetails-looking-for-a-money-out
        ), error)
      end
    end
  end
end
