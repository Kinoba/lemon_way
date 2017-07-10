# frozen_string_literal: true

module LemonWay
  module Generators
    class Id
      class << self
        def generate
          rand(10**20).to_s
        end
      end
    end
  end
end
