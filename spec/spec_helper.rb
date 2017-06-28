$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'webmock/rspec'
require 'lemonway'

WebMock.disable_net_connect!(allow_localhost: true)

Dir[File.join(Dir.pwd, 'spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.before(:each) { Lemonway.reset }

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.order = :random

  Kernel.srand config.seed
end
