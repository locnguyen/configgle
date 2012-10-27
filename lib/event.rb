require 'data_mapper'
require 'registration_template'

class Event
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :start_date, Date
  property :end_date, Date
  property :homepage, URI
  property :description, String
  property :capacity, Integer

  belongs_to :organization
  has n, :registrations
  has n, :registration_templates

  attr_reader :name, :start_date, :end_date, :homepage, :description, :capacity

  def initialize(attributes = {})
    raise(ArugmentError, 'Cannot create event without an Organization', caller) if attributes[:organization].nil?

    @registration_templates = []
    attributes.each { |k, v| instance_variable_set("@#{k}", v) unless v.nil? }
  end

  def is_over?
    Date.today > @end_date
  end

  def is_happening_now?
    d = Date.today
    d >= @start_date and d <= @end_date
  end

  def create_registration_template(tmpl = {})
    tmpl[:event] = self;
    RegistrationTemplate.new tmpl
  end

  def create_and_add_registration_template(tmpl = {})
    @registration_templates << create_registration_template(tmpl)
  end
end
