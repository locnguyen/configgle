require 'data_mapper'

class Event
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :start_date, Date
  property :end_date, Date
  property :homepage, URI
  property :description, String

  belongs_to :organization
end
