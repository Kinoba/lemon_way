require 'lemonway/error'

module Lemonway
  module Errors
    class GetWalletParameterError < LemonwayError
      def initialize
        super(%{You need to specify the walletId or email of the wallet.
          Try `Lemonway::Wallet.get(wallet: ID)` or `Lemonway::Wallet.get(email: 'email@example.com')`

          API: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/getwalletdetails-getting-detailed-wallet-data
        })
      end
    end

    class RegisterWalletParameterError < LemonwayError
      def initialize
        super(%{You need to specify the wallet informations.
          Try with at least the following parameters:
          { wallet: , clientMail: , clientFirstName: , clientLastName: , ctry: , birthdate: , payerOrBeneficiary: }

          API: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/registerwallet-creating-a-new-wallet
        })
      end
    end

    class UpdateWalletParameterError < LemonwayError
      def initialize
        super(%{You need to specify the wallet informations.

          API: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/updatewalletdetails-update-wallet-data
        })
      end
    end

    class UpdateWalletStatusParameterError < LemonwayError
      def initialize
        super(%{You need to specify the wallet informations.

          API: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/updatewalletstatus
        })
      end
    end

    class UploadFileParameterError < LemonwayError
      def initialize
        super(%{You need to specify the wallet informations.

          API: http://documentation.lemonway.fr/api-en/directkit/manage-wallets/uploadfile-document-upload-for-kyc
        })
      end
    end
  end
end
