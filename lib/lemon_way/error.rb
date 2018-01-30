# frozen_string_literal: true

module LemonWay
  class MissingConfigurationError < StandardError
    def initialize
      super(%(Your LemonWay configuration is missing.
        Try:

        LemonWay.configuration = {
          login: 'YOUR_LOGIN',
          password: 'YOUR_PASSWORD',
          company: 'YOUR_COMPANY'
        }

        These are the optional options: { sandbox:, language: }
      ))
    end
  end

  class LemonWayError < StandardError
    attr_reader :code
    attr_reader :message
    attr_reader :documentation

    DIRECKIT_DOCUMENTATION_URL = 'http://documentation.lemonway.fr/api-en/directkit'.freeze

    def initialize(error = {})
      @code = error.try(:[], :code)
      @message = error.try(:[], :msg)
      @documentation = DIRECKIT_DOCUMENTATION_URL

      super(error)
    end
  end

  class AuthenticationError < StandardError
    @message = 'Authentication error, please double check your Lemonway credentials'

    def initialize(_error)
      super(%(
        Authentication error, please double check your Lemonway credentials
      ))
    end
  end
end
