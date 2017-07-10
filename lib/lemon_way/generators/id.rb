# frozen_string_literal: true

module LemonWay
  module Generators
    class Id
      class << self
        def generate(length: 20)
          rand(10**length).to_s
        end
      end
    end
  end
end
