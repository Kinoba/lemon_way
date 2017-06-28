require 'lemonway/errors/form'

module Lemonway
  class Form
    class << self
      def create(params = {})
        Lemonway.client.send_request('CreatePaymentForm', '1.0', params)
      end

      def get(params = {})
        Lemonway.client.send_request('GetCompletedPaymentForm', '1.0', params)
      end

      def disable(params = {})
        Lemonway.client.send_request('DisablePaymentForm', '1.0', params)
      end
    end
  end
end
