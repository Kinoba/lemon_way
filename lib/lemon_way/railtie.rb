require 'lemon_way/middleware'

module LemonWay
  class Railtie < ::Rails::Railtie
    initializer 'lemon_way.configure_rails_initialization' do |app|
      app.middleware.use LemonWay::Middleware
    end
  end
end
