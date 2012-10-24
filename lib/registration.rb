require 'data_mapper'

class Registration
  include DataMapper::Resource

  property :id, Serial
  property :completed_date, DateTime

  belongs_to :event
  belongs_to :member

  def initialize(attributes = {})
    raise(ArgumentError, 'Need an event to create a registration', caller) if attributes[:event].nil?
    raise(ArgumentError, 'Need member to create a registration', caller) if attributes[:member].nil?

  end
end
