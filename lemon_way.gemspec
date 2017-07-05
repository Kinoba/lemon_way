# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lemon_way/version'

Gem::Specification.new do |spec|
  spec.name          = 'lemon_way'
  spec.version       = LemonWay::VERSION
  spec.authors       = ['Alexandre Ktifa', 'Julien Lerpscher']
  spec.email         = ['contact@mespetitsartistes.fr']
  spec.summary       = 'Client for LemonWay Directkit API in JSON'
  spec.description   = 'Client for LemonWay Directkit API in JSON'
  spec.homepage      = 'https://github.com/MesPetitsArtistes/lemon_way'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0")
                                        .reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 3.0'
  spec.add_development_dependency 'rubocop', '0.48.1'

  spec.add_dependency 'httparty'
  spec.add_dependency 'activesupport'
end
