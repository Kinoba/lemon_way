# frozen_string_literal: true

require 'lemon_way/errors/form'

module LemonWay
  class Form
    class << self
      def create(params = {})
        params[:optId] = params.delete(:id) || LemonWay::Generators::Id.generate(length: 60)
        LemonWay.client.send_request('CreatePaymentForm', '1.0', params)
      end

      def get(params = {})
        params[:formId] = params.delete(:id)
        LemonWay.client.send_request('GetCompletedPaymentForm', '1.0', params)
      end

      def disable(params = {})
        params[:formId] = params.delete(:id)
        LemonWay.client.send_request('DisablePaymentForm', '1.0', params)
      end
    end
  end
end
