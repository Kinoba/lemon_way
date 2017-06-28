require 'lemonway/error'

module Lemonway
  module Errors
    class GetWalletDetailsError < LemonwayError
      def initialize(error)
        super(%{You need to specify the walletId or email of the wallet.
        Try `Lemonway::Wallet.get(wallet: ID)` or `Lemonway::Wallet.get(email: 'email@example.com')`

        API: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/getwalletdetails-getting-detailed-wallet-data
        }, error)
      end
    end

    class RegisterWalletError < LemonwayError
      def initialize(error)
        super(%{You need to specify the wallet informations.
          Try with at least the following parameters:
          { wallet: , clientMail: , clientFirstName: , clientLastName: , ctry: , birthdate: , payerOrBeneficiary: }

          API: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/registerwallet-creating-a-new-wallet
        }, error)
      end
    end

    class UpdateWalletDetailsError < LemonwayError
      def initialize(error)
        super(%{You need to specify the wallet informations.

          API: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/updatewalletdetails-update-wallet-data
        }, error)
      end
    end

    class UpdateWalletStatusError < LemonwayError
      def initialize(error)
        super(%{You need to specify the wallet informations.

          API: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/updatewalletstatus
        }, error)
      end
    end

    class UploadFileError < LemonwayError
      def initialize(error)
        super(%{You need to specify the wallet informations.

          API: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/uploadfile-document-upload-for-kyc
        }, error)
      end
    end
  end
end
