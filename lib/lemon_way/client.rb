# frozen_string_literal: true

require 'lemon_way/error'
require 'lemon_way/response_adapter'
require 'json'
require 'httparty'

module LemonWay
  class Client
    include HTTParty

    DIRECTKIT_URL = \
      'https://sandbox-api.lemonway.fr/mb/{company_name}/{env}/directkitjson2/Service.asmx'.freeze
    REQUIRED_CONFIGURATION = %i[login password company].freeze
    DEFAULT_LANGUAGE = 'fr'.freeze
    DEFAULT_HEADERS = {
      'Content-Type' => 'application/json; charset=utf-8',
      'Accept' => 'application/json',
      'Cache-Control' => 'no-cache',
      'Pragma' => 'no-cache'
    }.freeze

    attr_reader :login, :password, :company, :society_wallet_id, :env, :options

    base_uri DIRECTKIT_URL
    debug_output $stdout

    def initialize(options = {})
      if (options.keys & REQUIRED_CONFIGURATION).size != REQUIRED_CONFIGURATION.size
        raise MissingConfigurationError.new
      end

      %i[login password company society_wallet_id].each do |key|
        instance_variable_set("@#{key}".to_sym, options.delete(key))
      end

      @env = options[:sandbox] ? 'dev' : 'prod'
      @options = options
    end

    def send_request(lw_method, version, params = {})
      response = perform_request(lw_method, version, params)

      ResponseAdapter.new(response)
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
        .sub('{env}', @env)
    end

    def request_body(version, params)
      {
        wlLogin: @login,
        wlPass: @password,
        language: @options[:language] || DEFAULT_LANGUAGE,
        version: version,
        walletIp: @options[:sandbox] ? '127.0.0.1' : RequestStore[:lemon_way][:ip],
        walletUa: @options[:sandbox] ? 'User-agent' : RequestStore[:lemon_way][:user_agent]
      }.merge(params)
    end
  end
end
