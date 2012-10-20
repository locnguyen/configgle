require 'data_mapper'
require 'dm-rspec2'

RSpec.configure do |config|
  config.include DataMapper::Matchers
  config.color_enabled = true
  config.tty = true
end
