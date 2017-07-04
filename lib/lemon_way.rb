require 'lemon_way/version'
require 'lemon_way/client'
require 'lemon_way/wallet'
require 'lemon_way/money_in'
require 'lemon_way/money_out'
require 'lemon_way/form'

module LemonWay
  @@client = nil
  @@configuration = {}

  def LemonWay.init
    @@client = Client.new(@@configuration)
  end

  def LemonWay.reset
    @@client = nil
    @@configuration = {}
  end

  def LemonWay.configuration=(configuration)
    @@configuration = configuration

    LemonWay.init
  end

  def LemonWay.client
    @@client || LemonWay.init
  end
end
