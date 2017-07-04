require 'lemon_way/error'

module LemonWay
  module Errors
    class MissingConfigurationError < LemonwayRubyError
      def initialize
        super(%{Your LemonWay configuration is missing.
          Try `LemonWay.configuration = { login: 'YOUR_LOGIN', password: 'YOUR_PASSWORD' }`.
          These are the optional options: { company: , sandbox:, language: }
        })
      end
    end
  end
end
