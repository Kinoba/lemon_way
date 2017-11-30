# frozen_string_literal: true

module LemonWay
  module Helpers
    module Forms
      DIRECTKIT_FORM_URL = \
        'https://sandbox-webkit.lemonway.fr/{company_name}/{env}/payment-page/?fId={id}'.freeze

      def lemon_way_form_url(form_id)
        DIRECTKIT_FORM_URL
          .sub('{company_name}', LemonWay.client.company)
          .sub('{env}', LemonWay.client.env)
          .sub('{id}', form_id)
      end
    end
  end
end
