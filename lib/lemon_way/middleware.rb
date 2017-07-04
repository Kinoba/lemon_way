require 'request_store'

module LemonWay
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      ::RequestStore.store[:lemon_way] = {
        ip: env['action_dispatch.remote_ip'].to_s,
        user_agent: env['HTTP_USER_AGENT']
      }

      @app.call(env)
    end
  end
end
