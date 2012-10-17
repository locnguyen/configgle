require 'data_mapper'

Dir[File.dirname(__FILE__) + "/*.rb"].each { |f| require f }

class Configgle
  include DataMapper::Resource

  property :id, Serial

  has n, :organizations

  def self.hi
    msg = 'Hello world!'
    puts msg
    msg
  end
end
