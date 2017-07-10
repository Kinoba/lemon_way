# frozen_string_literal: true

require 'lemon_way/middleware'
require 'lemon_way/helpers/forms'

module LemonWay
  class Railtie < ::Rails::Railtie
    initializer 'lemon_way.configure_rails_initialization' do |app|
      app.middleware.use LemonWay::Middleware
      ActionView::Base.send(:include, LemonWay::Helpers::Forms)
    end
  end
end
