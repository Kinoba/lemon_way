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
    DIRECKIT_DOCUMENTATION_URL = 'http://documentation.lemonway.fr/api-en/directkit'.freeze

    def initialize(error = {})
      super(%(
        Code: #{error.try(:[], :code)}
        Message: #{error.try(:[], :msg)}
        Documentation: #{DIRECKIT_DOCUMENTATION_URL}
      ))
    end
  end
end
