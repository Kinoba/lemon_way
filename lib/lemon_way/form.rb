require 'lemon_way/errors/form'

module LemonWay
  class Form
    class << self
      def create(params = {})
        LemonWay.client.send_request('CreatePaymentForm', '1.0', params)
      end

      def get(params = {})
        LemonWay.client.send_request('GetCompletedPaymentForm', '1.0', params)
      end

      def disable(params = {})
        LemonWay.client.send_request('DisablePaymentForm', '1.0', params)
      end
    end
  end
end
