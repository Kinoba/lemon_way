# frozen_string_literal: true

require 'lemon_way/middleware'
require 'lemon_way/helpers/forms'
require 'lemon_way/helpers/money_in'

module LemonWay
  class Railtie < ::Rails::Railtie
    initializer 'lemon_way.configure_rails_initialization' do |app|
      app.middleware.use LemonWay::Middleware
      ActionView::Base.send(:include, LemonWay::Helpers::Forms)
      ActionView::Base.send(:include, LemonWay::Helpers::MoneyIn)
    end
  end
end
