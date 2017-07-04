# frozen_string_literal: true

require 'lemon_way/error'

module LemonWay
  module Errors
    class GetWalletDetailsError < LemonWayError
      def initialize(error)
        super(%(
        Documentation: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/getwalletdetails-getting-detailed-wallet-data
        ), error)
      end
    end

    class RegisterWalletError < LemonWayError
      def initialize(error)
        super(%(
        Documentation: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/registerwallet-creating-a-new-wallet
        ), error)
      end
    end

    class UpdateWalletDetailsError < LemonWayError
      def initialize(error)
        super(%(
        Documentation: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/updatewalletdetails-update-wallet-data
        ), error)
      end
    end

    class UpdateWalletStatusError < LemonWayError
      def initialize(error)
        super(%(
        Documentation: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/updatewalletstatus
        ), error)
      end
    end

    class UploadFileError < LemonWayError
      def initialize(error)
        super(%(
        Documentation: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/uploadfile-document-upload-for-kyc
        ), error)
      end
    end

    class GetWalletTransHistoryError < LemonWayError
      def initialize(error)
        super(%(
        Documentation: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/getwallettranshistory-get-list-of-all-transactions-of-a-wallet
        ), error)
      end
    end
  end
end
