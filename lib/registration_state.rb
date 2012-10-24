require 'data_mapper'

class RegistrationState
  include DataMapper::Resource

  property :id, Serial
  property :code, String
  property :name, String

  has n, :registrations
end
