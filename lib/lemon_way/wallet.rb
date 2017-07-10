# frozen_string_literal: true

require 'lemon_way/errors/wallet'
require 'lemon_way/generators/id'

module LemonWay
  class Wallet
    class << self
      def get(params = {})
        params[:wallet] = params.delete(:id)
        LemonWay.client.send_request('GetWalletDetails', '2.0', params)
      end

      def register(params = {})
        params[:wallet] = params.delete(:id) || LemonWay::Generators::Id.generate
        LemonWay.client.send_request('RegisterWallet', '1.1', params)
      end

      def update(params = {})
        params[:wallet] = params.delete(:id)
        LemonWay.client.send_request('UpdateWalletDetails', '1.0', params)
      end

      def update_status(params = {})
        params[:wallet] = params.delete(:id)
        LemonWay.client.send_request('UpdateWalletStatus', '1.0', params)
      end

      def upload_file(params = {})
        params[:wallet] = params.delete(:id)
        LemonWay.client.send_request('UploadFile', '1.1', params)
      end

      def transactions_history(params = {})
        params[:wallet] = params.delete(:id)
        LemonWay.client.send_request('GetWalletTransHistory', '2.1', params)
      end
    end
  end
end
