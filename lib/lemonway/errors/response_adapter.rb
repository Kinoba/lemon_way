require 'lemonway/error'

module Lemonway
  module Errors
    class ResponseError < LemonwayError
      def initialize(error)
        super(%{
          Response error.

          Code: #{error['Code']}
          Message: #{error['Msg']}
        })
      end
    end
  end
end
