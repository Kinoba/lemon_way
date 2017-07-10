# frozen_string_literal: true

require 'request_store'

module LemonWay
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)

      ::RequestStore.store[:lemon_way] = {
        ip: request.ip,
        user_agent: request.user_agent
      }

      @app.call(env)
    end
  end
end
