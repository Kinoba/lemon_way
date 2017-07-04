module LemonWay
  class LemonwayRubyError < StandardError
    def initialize(message = '', error = {})
      super(%{
        #{error_informations(error)}
        #{message}
      })
    end

    private

    def error_informations(error)
      return if error.blank?

      %{
        Code: #{error[:code]}
        Message: #{error[:msg]}
      }
    end
  end
end
