# frozen_string_literal: true

require 'lemon_way/errors/wallet'

module LemonWay
  class Wallet
    class << self
      def get(params = {})
        LemonWay.client.send_request('GetWalletDetails', '2.0', params)
      end

      def register(params = {})
        LemonWay.client.send_request('RegisterWallet', '1.1', params)
      end

      def update(params = {})
        LemonWay.client.send_request('UpdateWalletDetails', '1.0', params)
      end

      def update_status(params = {})
        LemonWay.client.send_request('UpdateWalletStatus', '1.0', params)
      end

      def upload_file(params = {})
        LemonWay.client.send_request('UploadFile', '1.1', params)
      end

      def transactions_history(params = {})
        LemonWay.client.send_request('GetWalletTransHistory', '2.1', params)
      end
    end
  end
end
