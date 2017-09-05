# frozen_string_literal: true

module LemonWay
  module Helpers
    module MoneyIn
      DIRECTKIT_MONEY_IN_URL = \
        'https://webkit.lemonway.fr/mb/{company_name}/{env}/?moneyintoken={token}'.freeze

      def lemon_way_money_in_url(money_in_token)
        DIRECTKIT_MONEY_IN_URL
          .sub('{company_name}', LemonWay.client.company)
          .sub('{env}', LemonWay.client.env)
          .sub('{token}', money_in_token)
      end
    end
  end
end
