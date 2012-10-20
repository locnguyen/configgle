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

  def initialize(attributes = {})
    raise(ArugmentError, 'Cannot create event without an Organization', caller) if attributes[:organization].nil?
    attributes.each { |k, v| instance_variable_set("@#{k}", v) unless v.nil? }
  end
end