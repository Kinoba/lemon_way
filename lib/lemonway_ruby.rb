# frozen_string_literal: true

require 'lemon_way/version'
require 'lemon_way/client'
require 'lemon_way/wallet'
require 'lemon_way/money_in'
require 'lemon_way/money_out'
require 'lemon_way/form'
require 'lemon_way/p2p'
require 'lemon_way/middleware'
require 'lemon_way/helpers/forms'
require 'lemon_way/helpers/money_in'
require 'lemon_way/generators/id'
require 'lemon_way/railtie' if defined?(Rails)

module LemonWay
  @@client = nil
  @@configuration = {}
  @@proxy = {}

  def self.init
    @@client = Client.new(@@configuration, @@proxy)
  end

  def self.reset
    @@client = nil
    @@configuration = {}
    @@proxy = {}
  end

  def self.configuration=(configuration)
    @@configuration = configuration
  end

  def self.proxy=(proxy)
    @@proxy = proxy
  end

  def self.client
    @@client || LemonWay.init
  end
end
