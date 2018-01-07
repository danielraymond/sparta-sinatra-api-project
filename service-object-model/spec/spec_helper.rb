require 'rspec'
require_relative '../lib/neo_api'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end
