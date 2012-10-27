require 'data_mapper'
require 'registration'
require 'event'

class RegistrationTemplate
  include DataMapper::Resource

  property :id, Serial
  property :template, Json
  property :name, String
  property :description, String
  property :created_at, DateTime
  property :updated_at, DateTime

  has n, :registrations
  belongs_to :event

  attr_reader :name, :description, :template

  def initialize(attrs = {})
    raise(ArgumentError, 'Cannot create template without event', caller) if attrs[:event].nil?
    @registrations = []
  end
end
