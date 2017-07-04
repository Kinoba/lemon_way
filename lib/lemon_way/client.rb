require 'lemon_way/errors/client'
require 'lemon_way/response_adapter'
require 'json'
require 'httparty'

module LemonWay
  class Client
    include HTTParty

    attr_reader :login, :password, :company, :options

    DIRECTKIT_URL = 'https://sandbox-api.lemonway.fr/mb/{company_name}/{env}/directkitjson2/Service.asmx'
    REQUIRED_CONFIGURATION = %i(login password company).freeze
    DEFAULT_LANGUAGE = 'fr'
    DEFAULT_HEADERS = {
      'Content-Type' => 'application/json; charset=utf-8',
      'Accept' => 'application/json',
      'Cache-Control' => 'no-cache',
      'Pragma' => 'no-cache'
    }

    base_uri DIRECTKIT_URL
    debug_output $stdout

    def initialize(options = {})
      if (options.keys & REQUIRED_CONFIGURATION).size != REQUIRED_CONFIGURATION.size
        raise Errors::MissingConfigurationError.new
      end

      @login = options[:login]
      @password = options[:password]
      @company = options[:company]
      @options = options.delete_if { |k, _v| REQUIRED_CONFIGURATION.include?(k) }
    end

    def send_request(lw_method, version, params = {})
      response = perform_request(lw_method, version, params)
      ResponseAdapter.new(lw_method, response)
    end

    private

    def perform_request(lw_method, version, params)
      self.class.post([directkit_url, lw_method].join('/'),
                      headers: DEFAULT_HEADERS,
                      body: { p: request_body(version, params) }.to_json)
    end

    def directkit_url
      DIRECTKIT_URL
        .sub('{company_name}', @company)
        .sub('{env}', @options[:sandbox] ? 'dev' : 'prod')
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
