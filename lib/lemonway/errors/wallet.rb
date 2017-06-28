require 'lemonway/error'

module Lemonway
  module Errors
    class GetWalletDetailsError < LemonwayError
      def initialize(error)
        super(%{
        Documentation: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/getwalletdetails-getting-detailed-wallet-data
        }, error)
      end
    end

    class RegisterWalletError < LemonwayError
      def initialize(error)
        super(%{
        Documentation: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/registerwallet-creating-a-new-wallet
        }, error)
      end
    end

    class UpdateWalletDetailsError < LemonwayError
      def initialize(error)
        super(%{
        Documentation: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/updatewalletdetails-update-wallet-data
        }, error)
      end
    end

    class UpdateWalletStatusError < LemonwayError
      def initialize(error)
        super(%{
        Documentation: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/updatewalletstatus
        }, error)
      end
    end

    class UploadFileError < LemonwayError
      def initialize(error)
        super(%{
        Documentation: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/uploadfile-document-upload-for-kyc
        }, error)
      end
    end

    class GetWalletTransHistoryError < LemonwayError
      def initialize(error)
        super(%{
        Documentation: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/getwallettranshistory-get-list-of-all-transactions-of-a-wallet
        }, error)
      end
    end
  end
end
