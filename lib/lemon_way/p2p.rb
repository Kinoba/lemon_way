# frozen_string_literal: true

require 'lemon_way/error'

module LemonWay
  class P2P
    class << self
      def send_payment(params = {})
        LemonWay.client.send_request('SendPayment', '1.0', params)
      end

      def get_payment_details(params = {})
        LemonWay.client.send_request('GetPaymentDetails', '1.0', params)
      end
    end
  end
end
