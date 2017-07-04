require 'lemon_way/error'

module LemonWay
  module Errors
    class CreatePaymentFormError < LemonwayRubyError
      def initialize(error)
        super(%{
        Documentation: http://documentation.lemonway.fr/api-en/directkit/money-in-credit-a-wallet/payment-form/createpaymentform-create-payment-form
        }, error)
      end
    end

    class GetCompletedPaymentFormError < LemonwayRubyError
      def initialize(error)
        super(%{
        Documentation: http://documentation.lemonway.fr/api-en/directkit/money-in-credit-a-wallet/payment-form/getcompletedpaymentform-get-details-of-a-completed-payment-form
        }, error)
      end
    end

    class DisablePaymentFormError < LemonwayRubyError
      def initialize(error)
        super(%{
        Documentation: http://documentation.lemonway.fr/api-en/directkit/money-in-credit-a-wallet/payment-form/disablepaymentform-disable-a-payment-form
        }, error)
      end
    end
  end
end
