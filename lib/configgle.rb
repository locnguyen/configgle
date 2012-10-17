require 'data_mapper'

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
