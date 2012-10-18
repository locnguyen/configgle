require 'data_mapper'

Dir[File.dirname(__FILE__) + "/*.rb"].each { |f| require f }

class Configgle
  include DataMapper::Resource

  property :id, Serial

  has n, :organizations
end
