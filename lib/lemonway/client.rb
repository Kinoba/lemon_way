require 'lemonway/errors/client'
require 'lemonway/response_adapter'
require 'json'
require 'httparty'

module Lemonway
  class Client
    include HTTParty

    attr_reader :login, :password, :options

    DIRECTKIT_URL     = 'https://sandbox-api.lemonway.fr/mb/demo/dev/directkitjson2/Service.asmx'
    DEFAULT_LANGUAGE  = 'fr'
    DEFAULT_HEADERS   = {
      'Content-Type' => 'application/json; charset=utf-8',
      'Accept' => 'application/json',
      'Cache-Control' => 'no-cache',
      'Pragma' => 'no-cache'
    }

    base_uri DIRECTKIT_URL
    debug_output $stdout

    def initialize(options = {})
      raise Errors::MissingConfigurationError.new if options[:login].nil? || options[:password].nil?

      @login = options[:login]
      @password = options[:password]
      @options = options.delete_if { |k, v| %i(login password).include?(k) }
    end

    def send_request(lw_method, version, params = {})
      response = perform_request(lw_method, version, params)
      ResponseAdapter.new(lw_method, response)
    end

    private

    def perform_request(lw_method, version, params)
      self.class.post([DIRECTKIT_URL, lw_method].join('/'),
                      headers: DEFAULT_HEADERS,
                      body: { p: request_body(version, params) }.to_json)
    end

    def request_body(version, params)
      {
        wlLogin: @login,
        wlPass: @password,
        language: @options[:language] || DEFAULT_LANGUAGE,
        version: version,
        walletIp: '127.0.0.1',
        walletUa: 'User-agent'
      }.merge(params)
    end
  end
end
