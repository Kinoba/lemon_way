require 'lemonway/error'

module Lemonway
  module Errors
    class MissingConfigurationError < LemonwayError
      def initialize
        super(%{Your Lemonway configuration is missing.
          Try `Lemonway.configuration = { login: 'YOUR_LOGIN', password: 'YOUR_PASSWORD' }`.
          These are the optional options: { sandbox:, language: }
        })
      end
    end
  end
end
