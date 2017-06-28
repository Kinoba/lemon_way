require 'lemonway/error'

module Lemonway
  module Errors
    class MoneyInWebInitError < LemonwayError
      def initialize(error)
        super(%{
        Documentation: http://documentation.lemonway.fr/api-en/directkit/money-in-credit-a-wallet/by-card/moneyinwebinit-indirect-mode-money-in-by-card-crediting-a-wallet
        }, error)
      end
    end

    class GetMoneyInTransDetailsError < LemonwayError
      def initialize(error)
        super(%{
        Documentation: http://documentation.lemonway.fr/api-en/directkit/money-in-credit-a-wallet/getmoneyintransdetails-looking-for-a-money-in
        }, error)
      end
    end

    class MoneyInValidateError < LemonwayError
      def initialize(error)
        super(%{
        Documentation: http://documentation.lemonway.fr/api-en/directkit/money-in-credit-a-wallet/by-card/moneyinvalidate-validation-of-a-money-in-deffered-payment-only
        }, error)
      end
    end
  end
end
