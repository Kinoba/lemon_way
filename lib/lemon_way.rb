# frozen_string_literal: true

require 'lemon_way/version'
require 'lemon_way/client'
require 'lemon_way/wallet'
require 'lemon_way/money_in'
require 'lemon_way/money_out'
require 'lemon_way/form'

module LemonWay
  @@client = nil
  @@configuration = {}

  def self.init
    @@client = Client.new(@@configuration)
  end

  def self.reset
    @@client = nil
    @@configuration = {}
  end

  def self.configuration=(configuration)
    @@configuration = configuration

    LemonWay.init
  end

  def self.client
    @@client || LemonWay.init
  end
end
