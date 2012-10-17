require 'data_mapper'
require 'dm-rspec2'

RSpec.configure do |config|
  config.include(DataMapper::Matchers)
end
