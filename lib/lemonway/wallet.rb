require 'lemonway/errors/wallet'

module Lemonway
  class Wallet
    class << self
      def register(params = {})
        raise Errors::RegisterWalletParameterError.new unless params.is_a?(Hash)

        Lemonway.client.send_request('RegisterWallet', '1.1', params)
      end

      def get(params = {})
        if !params.is_a?(Hash) || (params[:wallet].nil? && params[:email].nil?)
          raise Errors::GetWalletParameterError.new
        end

        Lemonway.client.send_request('GetWalletDetails', '2.0', params)
      end

      def update(params = {})
        if !params.is_a?(Hash) || params[:wallet].nil?
          raise Errors::UpdateWalletParameterError.new
        end

        Lemonway.client.send_request('UpdateWalletDetails', '1.0', params)
      end

      def update_status(params = {})
        if !params.is_a?(Hash) || params[:wallet].nil?
          raise Errors::UpdateWalletStatusParameterError.new
        end

        Lemonway.client.send_request('UpdateWalletStatus', '1.0', params)
      end

      def upload_file(params = {})
        raise Errors::UploadFileParameterError.new unless params.is_a?(Hash)

        Lemonway.client.send_request('UploadFile', '1.1', params)
      end
    end
  end
end
