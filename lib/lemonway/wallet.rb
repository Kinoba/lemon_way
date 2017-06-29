require 'lemonway/errors/wallet'

module Lemonway
  class Wallet
    class << self
      def get(params = {})
        Lemonway.client.send_request('GetWalletDetails', '2.0', params)
      end

      def register(params = {})
        Lemonway.client.send_request('RegisterWallet', '1.1', params)
      end

      def update(params = {})
        Lemonway.client.send_request('UpdateWalletDetails', '1.0', params)
      end

      def update_status(params = {})
        Lemonway.client.send_request('UpdateWalletStatus', '1.0', params)
      end

      def upload_file(params = {})
        Lemonway.client.send_request('UploadFile', '1.1', params)
      end

      def transactions_history(params = {})
        Lemonway.client.send_request('GetWalletTransHistory', '2.1', params)
      end
    end
  end
end
