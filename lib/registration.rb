require 'data_mapper'
require 'event'
require 'member'

class Registration
  include DataMapper::Resource

  property :id, Serial
  property :completed_date, DateTime

  belongs_to :event
  belongs_to :member
  belongs_to :registration_template

  attr_reader :event, :member, :completed_date

  def initialize(attributes = {})
    raise(ArgumentError, 'Need an event to create a registration', caller) if attributes[:event].nil?
    raise(ArgumentError, 'Need member to create a registration', caller) if attributes[:member].nil?

    attributes.each { |k, v| instance_variable_set("@#{k}", v) unless v.nil? }
  end
end
