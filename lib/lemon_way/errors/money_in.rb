# frozen_string_literal: true

require 'lemon_way/error'

module LemonWay
  module Errors
    class MoneyInWebInitError < LemonWayError
      def initialize(error)
        super(%(
        Documentation: http://documentation.lemonway.fr/api-en/directkit/money-in-credit-a-wallet/by-card/moneyinwebinit-indirect-mode-money-in-by-card-crediting-a-wallet
        ), error)
      end
    end

    class GetMoneyInTransDetailsError < LemonWayError
      def initialize(error)
        super(%(
        Documentation: http://documentation.lemonway.fr/api-en/directkit/money-in-credit-a-wallet/getmoneyintransdetails-looking-for-a-money-in
        ), error)
      end
    end

    class MoneyInValidateError < LemonWayError
      def initialize(error)
        super(%(
        Documentation: http://documentation.lemonway.fr/api-en/directkit/money-in-credit-a-wallet/by-card/moneyinvalidate-validation-of-a-money-in-deffered-payment-only
        ), error)
      end
    end
  end
end
