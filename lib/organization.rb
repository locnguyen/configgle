require 'data_mapper'
require 'event'

class Organization
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :homepage, URI
  property :facebook, URI
  property :twitter, URI
  property :phone_number, String

  has n, :events
  has n, :memberships
  has n, :members, :through => :memberships
  belongs_to :configgle

  attr_reader :members
  attr_reader :events

  def initialize
    @members = []
    @events = []
  end

  def add_member(member)
    @members << member
  end

  def init_event(event_attrs = {})
    event_attrs[:organization] = self
    Event.new(event_attrs)
  end

  def create_and_add_event(event_attrs = {})
    e = init_event(event_attrs)
    @events << e
  end

  def total_events
    @events.size
  end
end
