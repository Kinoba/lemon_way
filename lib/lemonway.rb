require 'lemonway/version'
require 'lemonway/client'
require 'lemonway/wallet'

module Lemonway
  @@client = nil
  @@configuration = {}

  def Lemonway.init(options = {})
    @@client = Client.new(options)
  end

  def Lemonway.reset
    @@client = nil
    @@configuration = {}
  end

  def Lemonway.configuration=(configuration)
    @@configuration = configuration

    Lemonway.init(@@configuration)
  end

  def Lemonway.client
    @@client || Lemonway.init({})
  end
end
